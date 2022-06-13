#!/bin/bash

# Download the latest images from instagram account
# will download, until image is encountered that has already been downloaded
#       (if you just want the newest images or all images already have been downloaded)
# to download the whole account, remove the "--fast-update" argument

# will write to stdout, and to logfile simultaneously

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
# NOTE:
#       use nohup e.g.:
#       nohup instaloader.sh &
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

USERNAME="petedavidson"
PASSWORD="ilovekimk"

# root directory where the archive is
ARCHIVE_DIR="/media/ig_archive"
# instaloader session
SESSION_FILE="/home/pete/.config/instaloader/session-petedavidson"
# the directory in which the logs should be saved
LOG_DIR="${ARCHIVE_DIR}/logs"
# filename of the log, identifiable by date and time
LOG_FILENAME="$(date +%Y-%m-%d_%H-%M-%S)_instaloader-latest.log"
# absoulte path to the log file
LOG_FILE="${LOG_DIR}/${LOG_FILENAME}"
# file with account usernames
ACCOUNT_LIST_FILE="${ARCHIVE_DIR}/scripts/accounts-latest"

mkdir -p "${LOG_DIR}"
touch "${LOG_FILE}"

ACCOUNTS=""
# reading accounts
for acc in $(grep -v '^#' ${ACCOUNT_LIST_FILE}) ; do
    ACCOUNTS="${ACCOUNTS} $acc"
done

python3 -m instaloader \
    --sessionfile "${SESSION_FILE}" \
    --login "${USERNAME}" --password "${PASSWORD}" \
    --fast-update \
    --dirname-pattern="${ARCHIVE_DIR}/{profile}" \
    --filename-pattern="{date_utc:%Y}/{date_utc:%m-%b}/{date_utc:%a-%d_%H-%M}" \
    --abort-on=400,429 \
    ${ACCOUNTS} \
    | tee -a "${LOG_FILE}"

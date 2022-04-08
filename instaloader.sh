#!/bin/bash

USERNAME="kimkardashian"
PASSWORD="kimkardashian"

ARCHIVE_DIR="/media/images/ig_archive"
LOG_DIR="${ARCHIVE_DIR}/logs"
LOG_FILENAME="$(date +%Y-%m-%d_%H-%M-%S)_instaloader.log"

mkdir -p "${LOG_DIR}"

python3 -m instaloader \
    --login "${USERNAME}" --password "${PASSWORD}" \
    --fast-update \
    --dirname-pattern="${ARCHIVE_DIR}/{profile}" \
    --filename-pattern='{date_utc:%Y}/{date_utc:%m-%b}/{date_utc:%a-%d_%H-%M}' \
    --abort-on=302,400,429 \
    yunglean2001 dg_bladee \
    >> "${LOG_DIR}/${LOG_NAME}"

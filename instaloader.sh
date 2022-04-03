#!/bin/bash

python -m instaloader --fast-update \
    --sessionfile ./instaloader-personal_account_username.session \
    --dirname-pattern='/media/images/ig_archive/{profile}' \
    --filename-pattern='{date_utc:%Y}/{date_utc:%m-%b}/{date_utc:%a-%d_%H-%M}' \
    dg_bladee

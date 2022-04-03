#!/bin/bash

USERNAME=kimkardashian
PASSWORD=kimkardashian

python3 -m instaloader \
    --login $USERNAME --password $PASSWORD \
    --dirname-pattern='/media/photo/ig_archive/{profile}' \
    --filename-pattern='{date_utc:%Y}/{date_utc:%m-%b}/{date_utc:%a-%d_%H-%M}' \
    draindler.page dg_bladee

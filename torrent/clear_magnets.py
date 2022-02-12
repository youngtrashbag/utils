#!/usr/bin/python3
"""
Scan subdirectories for 'magnet' file, if dir is empty, delete.
When deleting a torrent via qBittorrent client, all data can be deleted,
but magnet file will remain

usage:
    clear_magnets.py /media/movies
"""

import os
import sys
import shutil
from pathlib import Path
from os.path import basename

qtorrent_url = 'http://localhost:8084/api/v2'


if not len(sys.argv) > 1:
    raise RuntimeError('pass path to torrent file directory as argument')

torrents_path = Path(sys.argv[1])

if not os.path.exists(torrents_path):
    raise RuntimeError('directory does not exist')

for dir_name, sub_dir, file_list in os.walk(torrents_path):
    dir_name = Path(dir_name)
    if sub_dir == [] and file_list == ['magnet']:
        # delete dir recursively
        shutil.rmtree(dir_name)
        print('Deleted stray magnet for: {}'.format(basename(dir_name)))

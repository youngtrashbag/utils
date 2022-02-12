#!/usr/bin/python3
"""
Scan subdirectories for 'magnet' file, containing the magnet uri.
The torrent will then be added to the qBittorrent client.

usage:
    add_magnet.py /media/movies
"""

import os
import sys
import json
import requests
from pathlib import Path
from os.path import basename

qtorrent_url = 'http://localhost:8084/api/v2'


if not len(sys.argv) > 1:
    raise RuntimeError('pass path to torrent file directory as argument')

torrents_path = Path(sys.argv[1])

if not os.path.exists(torrents_path):
    raise RuntimeError('directory does not exist')

torrents = {}

for dirName, subDir, fileList in os.walk(torrents_path):
    if 'magnet' in fileList:
        full_path = torrents_path / dirName / 'magnet'
        with open(full_path, mode='r', encoding='UTF-8') as magnet:
            torrents[str(full_path)] = magnet.read()


for savepath, magnet_url in torrents.items():
    data = {
        'urls': (None, magnet_url),
        'savepath': (None, str(Path(savepath).parents[1])),
    }

    response = requests.post(f'{qtorrent_url}/torrents/add', files=data)

    # info on which torrents failed and which succeeded
    print('{}: {}'.format(response.text[:-1], basename(Path(savepath).parent)))

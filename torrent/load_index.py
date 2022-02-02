#!/usr/bin/python3
"""
Read the index file, that has been created with create_index.py

Add all the torrents to the client
"""

import os
import sys
import json
import requests
from pathlib import Path

qtorrent_url = 'http://localhost:8084/api/v2'


if not len(sys.argv) > 1:
    raise RuntimeError('pass path to torrent index file as argument')

index_path = Path(sys.argv[1])

if not os.path.exists(index_path):
    raise RuntimeError('file does not exist')

with open(index_path, mode='r', encoding='UTF-8') as index_file:
    torrent_index = json.loads(index_file.read())

for torrent in torrent_index:
    data = {
        'urls': (None, torrent['magnet_uri']),
        'savepath': (None, str(Path(torrent['path']).parent)),
        'category': (None, torrent['category']),
    }

    response = requests.post(f'{qtorrent_url}/torrents/add', files=data)

    # response staus 200, text is 'Fails.'
    print(response.text)


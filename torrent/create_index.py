"""
Create a json file that contains an array of relevant data for each torrent

Works only with qBittorrent WebUI running
"""

import os
import sys
import json
import requests
from pathlib import Path

qtorrent_url = 'http://localhost:8084/api/v2'

if not len(sys.argv) > 1:
    raise RuntimeError('pass path to torrent index file as argument')

torrent_list = requests.get(f'{qtorrent_url}/torrents/info').json()

torrent_index = []

for torrent in torrent_list:
    t_path = Path(torrent['content_path']) /'magnet'
    try:
        with open(t_path, mode='w', encoding='UTF-8') as m_file:
            m_file.write(torrent['magnet_uri'])
    except FileNotFoundError as e:
        print(e)
    except NotADirectoryError as e:
        # TODO: what if torrent is downloaded as single file ?
        print(e)

    torrent_info = {
        'hash': torrent['hash'],
        'magnet_uri': torrent['magnet_uri'],
        'path': torrent['content_path'],
        'name': torrent['name'],
        'category': torrent['category'],
    }
    torrent_index.append(torrent_info)

# save torrent_index as index file for hashes and magnet uri
if len(sys.argv) > 1:
    index_file_path = Path(sys.argv[1])
    if os.path.isdir(index_file_path.parent):
        with open(index_file_path, mode='w', encoding='UTF-8') as index_file:
            index_file.write(json.dumps(torrent_index))


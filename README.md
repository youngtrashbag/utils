# utils

some tools I use to make things easier

## `keepass`

> NOTE: this depends upon [`rclone`](https://rclone.org/)

synchronises my keepass file with my google drive

usage

`keepass`
    pulls kdbx

`keepass push`
    uploads kdbx to drive

## `torrent/`

### `create_index.py`

> NOTE: python3 and qbittorrent web-server enabled

usage

`python3 create_index.py torren_index.json`
    creates file in json format, which contains info on all torrents
    
    such as:
    - hash (unique id)
    - magnet uri
    - category
    - path
    - name (name of the root object, most of the time its a folder, but can be a single file as well)

# `unzip.sh`

unzips all `.zip` files in a directory, and puts the contents into folders by the same name of the zip file,
except for removing the extension

# `convert.sh`

converts iphone photos (`.HEIC`) to `.jpg` via `heif-convert`

# `start_librespot.sh`

very lazy way to start [librespot](https://github.com/librespot-org/librespot)


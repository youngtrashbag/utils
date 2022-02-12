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

`python3 create_index.py torrent_index.json`  
    creates file in json format, which contains info on all torrents
    
    such as:
    - hash (unique id)
    - magnet uri
    - category
    - path
    - name (name of the root object, most of the time its a folder, but can be a single file as well)

> Note: this also creates a file `magnet`, which contains the magnet URI

### `load_index.py`

adds the torrents to the qbittorrent client, with the previously created index

usage

`python3 load_index.py torrent_index.json`

### `load_magnets.py`

scans the immediate subdirectories for `magnet` files.
they will then be added to the qbittorrent client

usage

`python3 load_magnets.py /home/movies`  
    scans all subdirectories of `/home/movies`,
    if file called `magnet` is found, it will add them to qbittorrent

### `clear_magnets.py`

scans the immediate subdirectories for `magnet` files.
if the directory is empty, delete it

(When deleting via qBittorrent client,
magnet files will not automatically get removed)

usage

`python3 clear_magnets.py /home/movies`

## `unzip.sh`

unzips all `.zip` files in a directory, and puts the contents into folders by the same name of the zip file,
except for removing the extension

## `convert.sh`

converts iphone photos (`.HEIC`) to `.jpg` via `heif-convert`

## `start_librespot.sh`

very lazy way to start [librespot](https://github.com/librespot-org/librespot)


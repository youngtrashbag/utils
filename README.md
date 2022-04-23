# utils

some tools I use to make things easier

## `sync_keepass`

> NOTE: this depends upon [`rclone`](https://rclone.org/)

synchronises my keepass file with my google drive

usage:

`keepass pull`
    pulls kdbx

`keepass push`
    uploads kdbx to drive

## `torrent/`

> NOTE: Obsolete, see [torrent-utils](https://github.com/youngtrashbag/torrent-utils) for better interface

## `unzip.sh`

unzips all `.zip` files in a directory, and puts the contents into folders by the same name of the zip file,
except for removing the extension

## `convert.sh`

converts iphone photos (`.HEIC`) to `.jpg` via `heif-convert`

## `start_librespot.sh`

very lazy way to start [librespot](https://github.com/librespot-org/librespot)

## `instaloader.sh`

archive posts of your favorite instagram accounts via instaloader

requirements:

- python3
- [instaloader](https://github.com/instaloader/instaloader)

## `docker-service.sh`

empty script that start, restart and stop functions that can be called directly.
can also be used without docker

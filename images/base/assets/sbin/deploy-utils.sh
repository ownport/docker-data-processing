#!/bin/sh

set -eu

update() {

    echo "[INFO] Update apt index" && \
        apt update

}

cleanup() {

    echo "[INFO] Remove apt index" && \
        rm -rf \
            /var/lib/apt/lists/* \
            /tmp/*

}

$@

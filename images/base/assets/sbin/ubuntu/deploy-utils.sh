#!/bin/sh

set -eu

export DEBIAN_FRONTEND=noninteractive

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

install() {

    apt install -y --no-install-recommends $@
}

$@

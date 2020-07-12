#!/bin/sh

set -eu

export DEBIAN_FRONTEND=noninteractive

update() {

    echo "[INFO] Update apt index" && \
        apk update

}

cleanup() {

    echo "[INFO] Remove apt index" && \
        rm -rf \
            /var/lib/apt/lists/* \
            /tmp/*

}

install() {

    echo "[INFO] Installing the next packages: $@" && \
        apk add --no-cache $@
}

$@

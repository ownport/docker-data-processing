#!/bin/sh

set -eu

/usr/local/bin/deploy-utils.sh update

echo "[INFO] Install additional command line tools" && \
    /usr/local/bin/deploy-utils.sh install "python3"

/usr/local/bin/deploy-utils.sh cleanup

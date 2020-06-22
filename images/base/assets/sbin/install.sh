#!/bin/sh

set -eu

export DEBIAN_FRONTEND=noninteractive

echo "[INFO] Install deploy-utils script" && \
    mv /tmp/assets/sbin/deploy-utils.sh /usr/local/sbin/

/usr/local/sbin/deploy-utils.sh update

echo "[INFO] Install additional command line tools" && \
    apt install -y --no-install-recommends \
        make \
        curl \
        jq

/usr/local/sbin/deploy-utils.sh cleanup

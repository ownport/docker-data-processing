#!/bin/sh

set -eu

# Configure Miniconda environment
# Miniconda installer archive, https://repo.continuum.io/miniconda/

export CONDA_DIR=/opt/conda 
export PATH="/opt/conda/bin:$PATH" 

export MINICONDA_VER=4.8.3
export MINICONDA=Miniconda3-py38_${MINICONDA_VER}-Linux-x86_64.sh 
export MINICONDA_URL=https://repo.continuum.io/miniconda/${MINICONDA}
export MINICONDA_MD5_SUM=d63adf39f2c220950a063e0529d4ff74

/usr/local/sbin/deploy-utils.sh update

echo "[INFO] Create directories" && \
        mkdir -p \
            ${CONDA_DIR} \
            /data

echo "[INFO] Install build deps" && \
    apt install -y --no-install-recommends \
            wget \
            bzip2 \
            unzip

echo "[INFO] Install miniconda" && \
    wget --no-check-certificate --progress=dot:mega ${MINICONDA_URL} -O /tmp/miniconda.sh && \
    echo "${MINICONDA_MD5_SUM}  /tmp/miniconda.sh" | md5sum -c - && \
    /bin/bash /tmp/miniconda.sh -f -b -p ${CONDA_DIR} && \
    echo "export PATH=$CONDA_DIR/bin:\$PATH" > /etc/profile.d/conda.sh && \
    conda update --all --yes && \
    conda config --set auto_update_conda False

echo "[INFO] Remove build deps and clear temp files" && \
    apt remove -y wget bzip2 unzip && \
    rm -rf ${CONDA_DIR}/pkgs/*

/usr/local/sbin/deploy-utils.sh cleanup


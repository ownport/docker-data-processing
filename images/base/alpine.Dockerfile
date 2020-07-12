FROM alpine:3.12

COPY assets/ /tmp/assets/

RUN ls -l /tmp/assets/sbin/alpine/deploy-utils.sh && \
    echo "[INFO] Install deploy-utils script" && \
        mv /tmp/assets/sbin/alpine/deploy-utils.sh /usr/local/bin/ && \
    echo '[INFO] Configure environment' && \
        /tmp/assets/sbin/install.sh 

WORKDIR /data

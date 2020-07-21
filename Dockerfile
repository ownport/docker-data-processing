FROM ubuntu:20.04

RUN echo "[INFO] Install additional command line tools" && \
		apk add --no-cache \ 
			bash \
			make \
			curl \
			jq && \
	echo "[INFO] Setup conda env" && \
		source /etc/profile.d/conda.sh && \ 
	echo "[INFO] Install conda components" && \
		conda install -y nomkl && \
		conda install -y pandas && \
		conda install -y -c conda-forge \
			python-snappy \
			snappy \
			protobuf \
			ipython \
			pyarrow \
			fastavro \
			python-avro \
			csvkit \
			lxml \
			psycopg2 \ 
			bitarray && \
	conda install -c keiserlab mmh3 

FROM ownport/alpine-glibc:3.7

COPY assets/ /tmp/assets/

RUN echo '[INFO] Configure environment' && \
    /tmp/assets/sbin/install.sh 

WORKDIR /data   
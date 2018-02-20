FROM ownport/alpine-miniconda:4.3.31

RUN echo "[INFO] Install additional command line tools" && \
		apk add --no-cache \ 
			bash \
			make \
			curl \
			jq && \
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
			psycopg2


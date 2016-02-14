FROM alpine:latest

RUN apk add --update \ 
		bash \
		make \
		python \
		py-pip \
		curl \
		jq && \
	rm -rf /var/cache/apk/*

RUN pip install \
		avro \
		fastavro \
		csvkit \
		xmlutils \
		requests 

RUN apk add --update gcc g++ snappy-dev python-dev libxml2-dev libxslt-dev && \
	pip install python-snappy lxml && \
	apk del gcc g++ snappy-dev python-dev libxml2-dev libxslt-dev && \
	rm -rf /var/cache/apk/*	


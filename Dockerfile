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
		xmlutils



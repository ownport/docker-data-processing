build:
	docker build -t 'ownport/data-processing:latest' .

run-env:
	docker run -ti --rm --name 'data-processing-env' \
		ownport/data-processing:latest \
		/bin/sh

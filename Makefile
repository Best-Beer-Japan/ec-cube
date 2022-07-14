all: build

build:
	docker build -t b2j/eccube-raw --force-rm=true .

clean-build:
	docker build -t b2j/eccube-raw --no-cache --force-rm=true .

run:
	docker run --rm -p 8989:80 b2j/eccube-raw

bash:
	docker run --rm -it -p 8989:80 --entrypoint="" b2j/eccube-raw /bin/bash

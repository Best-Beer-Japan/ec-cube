all: build

build:
	docker build -t b2j/eccube --force-rm=true .

clean-build:
	docker build -t b2j/eccube --no-cache --force-rm=true .

push:
	aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 532448714913.dkr.ecr.ap-northeast-1.amazonaws.com
	docker tag b2j/eccube:latest 532448714913.dkr.ecr.ap-northeast-1.amazonaws.com/b2j/eccube:latest
	docker push 532448714913.dkr.ecr.ap-northeast-1.amazonaws.com/b2j/eccube
	docker image rmi 532448714913.dkr.ecr.ap-northeast-1.amazonaws.com/b2j/eccube

run:
	docker run --rm -p 8989:80 b2j/eccube

bash:
	docker run --rm -it -p 8989:80 --entrypoint="" b2j/eccube /bin/bash

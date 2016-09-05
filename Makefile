TAG := rest4hub/golang-glide

build:
	docker pull golang; \
	docker build -t ${TAG} .

clean:
	docker rmi ${TAG}

rebuild: clean build

release:
	clear
	bash -c 'export GO_ENV=$$(docker run rest4hub/golang-glide go env); \
	export GO_VERSION=$$(docker run rest4hub/golang-glide go version); \
	export GLIDE_VERSION=$$(docker run rest4hub/golang-glide glide -v); \
	bash README.tpl > README.md'

run:    
	docker run --rm -it ${TAG}

.PHONY: build

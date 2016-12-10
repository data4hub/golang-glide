BRANCH = $(shell git rev-parse --abbrev-ref HEAD)
TAG := rest4hub/golang-glide:$(BRANCH)

build:
	docker pull rest4hub/golang-glide:fswatch; \
	docker build -t ${TAG} .

clean:
	docker rmi ${TAG}

rebuild: clean build

release:
	clear
	bash -c 'export GO_ENV=$$(docker run $(TAG) go env); \
	export GO_VERSION=$$(docker run $(TAG) go version); \
	export GLIDE_VERSION=$$(docker run $(TAG) glide -v); \
	export FSWATCH_VERSION=$$(docker run $(TAG) fswatch -version); \
	bash README.tpl > README.md'

run:    
	docker run --rm -it ${TAG}

publish:
	docker push ${TAG}

.PHONY: build

TAG := rest4hub/golang-glide:$(shell git rev-parse --abbrev-ref HEAD)

build:
	docker pull golang; \
	docker build -t ${TAG} .

clean:
	docker rmi ${TAG}

rebuild: clean build

release:
	clear
	bash -c 'export GO_ENV=$$(docker run $(TAG) go env); \
	export GO_VERSION=$$(docker run $(TAG) go version); \
	export GLIDE_VERSION=$$(docker run $(TAG) glide -v); \
	bash README.tpl > README.md'

run:    
	docker run --rm -it ${TAG}

publish:
	docker push ${TAG}

.PHONY: build

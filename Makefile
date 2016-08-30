TAG := golang-glide

build:
	docker pull golang; \
	docker build -t ${TAG} .

run:    
	docker run --rm -it ${TAG}

.PHONY: build

TAG := rest4hub/golang-glide

build:
	docker pull golang; \
	docker build -t ${TAG} .

clean:
	docker rmi ${TAG}

rebuild: clean build

run:    
	docker run --rm -it ${TAG}

.PHONY: build

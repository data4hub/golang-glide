build:
	docker build -t golang-glide-gitsemver .

run:    
	docker run --rm -it golang-glide

.PHONY: build

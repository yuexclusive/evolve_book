.PHONY: clean
clean:
	docker images -f "dangling=true" | grep -v kindest | awk 'NR!=1{print $$3}' | xargs docker rmi

build:
	mdbook build

.PHONY: image
image: build
	docker build --no-cache -f book.dockerfile -t yuexclusive/evolve_book:latest .
	make clean

.PHONY: run
run: image
	docker run --rm -it -p 8883:80 yuexclusive/evolve_book:latest

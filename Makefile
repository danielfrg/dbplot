all: help

docker-images:  ##
	cd ./dbplot/tests/docker/ && docker build -t postgres-data .
.PHONY: docker-images

postgres-data:  ##
	docker run -p 5432:5432 -it postgres-data

help:
	@grep -E '^[a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?##"; OFS="\t\t"}; {printf "\033[36m%-30s\033[0m %s\n", $$1, ($$2==""?"":$$2)}'

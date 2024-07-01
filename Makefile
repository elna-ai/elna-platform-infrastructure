 # Define the image name
IMAGE_NAME := elna-platform-infrastructure
DIR_NAME := $(shell basename $(shell pwd))
PROJECT_VOLUME := ${PWD}:/${DIR_NAME}

# Build the Docker image
docker-build:
	@docker buildx build -t ${IMAGE_NAME} .

docker-clean-build:
	@docker buildx build --no-cache -t ${IMAGE_NAME} .

# Run the Docker container
docker-run:
	@docker run -it -v ${PROJECT_VOLUME} -w /${DIR_NAME} ${IMAGE_NAME}

build:
	@docker run -it -v ${PROJECT_VOLUME} -w /${DIR_NAME} ${IMAGE_NAME}

test:
	@docker run -it -v ${PROJECT_VOLUME} -w /${DIR_NAME} ${IMAGE_NAME} cargo test

# Default target
.PHONY: all
all: build-container

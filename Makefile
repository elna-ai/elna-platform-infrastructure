 # Define the image name
IMAGE_NAME := elna-platform-infrastructure
DIR_NAME := $(shell basename $(shell pwd))
PROJECT_VOLUME := ${PWD}:/${DIR_NAME}

# Build the Docker image
build:
	@docker buildx build -t ${IMAGE_NAME} .

# Clean build the Docker image
cbuild:
	@docker buildx build --no-cache -t ${IMAGE_NAME} .

# Run the Docker container
run:
	@docker run -it -v ${PROJECT_VOLUME} -v ${PWD}/scripts:/scripts -w /${DIR_NAME} ${IMAGE_NAME}

# Default target
.PHONY: all
all: build

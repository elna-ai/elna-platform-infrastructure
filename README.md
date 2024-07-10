# Project build system

This a build system built on top of docker container.

## Prerequisites
### 1. **Docker**
Make sure to install docker in the host machine.
install docker by following the [Get docker](https://docs.docker.com/get-docker/) guide

## Usage
### 1. **Build docker image**
Inorder to use the build system first the docker image.
build the image use the following command.
##### - Build using cache
`make docker-build`
##### - Build using cache
`make docker-clean-build`

### 2. **Run docker container in interactive mode**
To get an interacticve terminal to test out the app,
run the docker container in interactive mode with the
project directory mounted and used as current work directory,

For running the docker container in interactive mode use the
following command,
`make docker-run`
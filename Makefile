.PHONY: run build

NUTCRACKER_VERSION=0.3.0
BUILD_VERSION=build-$(shell git rev-parse --short HEAD)
UBUNTU_VERSION=ubuntu-$(shell grep '^FROM ubuntu' Dockerfile  | cut -d ':' -f 2)

ifndef TAG
	TAG := $(NUTCRACKER_VERSION)_$(UBUNTU_VERSION)_$(BUILD_VERSION)
endif

REPO=wattpad/docker-nutcracker
IMAGE=$(REPO):$(TAG)

build:
	docker build -t $(IMAGE) --build-arg NUTCRACKER_VERSION=$(NUTCRACKER_VERSION) .

push: build
	docker push $(IMAGE)

run: build
	docker run -ti --rm $(IMAGE) bash

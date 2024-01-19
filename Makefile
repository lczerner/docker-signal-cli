export CONTAINER_NAME := signal
export DOCKER := docker
export INSTALL_DIR := /opt/signal-cli/bin

SIGNAL_CLI_VERSION ?= 0.12.5

CMDS := all build install

all: build

build:
	$(DOCKER) build --build-arg SIGNAL_CLI_VERSION=$(SIGNAL_CLI_VERSION) -t $(CONTAINER_NAME) .

install:
	@mkdir -p $(INSTALL_DIR)
	@install signal-cli $(INSTALL_DIR)/signal-cli
	@ln -sf $(INSTALL_DIR)/signal-cli /usr/local/bin/

.PHONY: $(CMDS)

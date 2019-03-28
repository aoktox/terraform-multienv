.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: apply destroy-backend destroy destroy-target plan-destroy plan plan-target prep
VARS="$(ENV).tfvars"
WORKSPACE="$(ENV)"
BOLD=$(shell tput bold)
RED=$(shell tput setaf 1)
GREEN=$(shell tput setaf 2)
YELLOW=$(shell tput setaf 3)
RESET=$(shell tput sgr0)

all: help

EXECUTABLES = terraform awsudo

prerequisites := $(foreach exec,$(EXECUTABLES),\
				$(if $(shell which $(exec)),some string,$(error "Cannot find $(exec) in PATH")))

help:	## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


set-env:
	@if [ -z $(ENV) ]; then \
		echo "$(BOLD)$(RED)ENV was not set$(RESET)"; \
		ERROR=1; \
	 fi
	@if [ -z $(AWS_ACCESS_KEY_ID) ]; then \
		echo "$(BOLD)$(RED)AWS_ACCESS_KEY_ID was not set.$(RESET)"; \
		ERROR=1; \
	 fi
	@if [ ! -z $${ERROR} ] && [ $${ERROR} -eq 1 ]; then \
		echo "$(BOLD)Example usage: \`ENV=demo make plan\`$(RESET)"; \
		exit 1; \
	 fi
	@if [ ! -f "$(VARS)" ]; then \
		echo "$(BOLD)$(RED)Could not find variables file: $(VARS)$(RESET)"; \
		exit 1; \
	 fi

plan: prep ## Plan an execution
	@terraform plan	-var-file="$(VARS)"
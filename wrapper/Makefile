.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: apply plan destroy
VARS="$(ENV).tfvars"
WORKSPACE="$(ENV)"
BOLD=$(shell tput bold)
RED=$(shell tput setaf 1)
RESET=$(shell tput sgr0)

all: help

help:	## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

check-env:
	@if [ -z $(ENV) ]; then \
		echo "$(BOLD)$(RED)ENV was not set$(RESET)"; \
		exit 1; \
	 fi
	@if [ ! -f "$(VARS)" ]; then \
		echo "$(BOLD)$(RED)Could not find variables file: $(VARS)$(RESET)"; \
		exit 1; \
	 fi

prep: check-env ## Prepare a new workspace (environment)
	@echo "$(BOLD)Initializing the terraform$(RESET)"
	@terraform init
	@echo "$(BOLD)Switching to workspace $(WORKSPACE)$(RESET)"
	@terraform workspace select $(WORKSPACE) || terraform workspace new $(WORKSPACE)


plan: prep ## Plan an execution
	@terraform plan	-var-file="$(VARS)"

apply: prep ## Run an execution
	@terraform apply -var-file="$(VARS)"

destroy: prep ## Destroy everything
	@terraform destroy -var-file="$(VARS)"
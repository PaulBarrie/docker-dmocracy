
.DEFAULT_GOAL := help

help:  ## Show the helps for the several commands
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
.PHONY: help

_clone: ## Clone the repository
	@git clone $(REPO) $(DIR)
.PHONY: _clone

clone: ## Clone all the repositories
	$(MAKE) _clone REPO=git@github.com:Mana-One/dmocracy-api.git DIR=api
	$(MAKE) _clone REPO=git@github.com:Mana-One/dmocracy-dapp.git DIR=app
	$(MAKE) _clone REPO=git@github.com:Mana-One/dmocracy-smart-contract.git DIR=smart-contract
.PHONY: clone

ps: ## Show the status of the containers
	@docker-compose ps
.PHONY: ps

up: ## Start the test blockchain and the containers
	@docker-compose up -d
.PHONY: up

rm: ## Remove the containers
	@docker-compose rm -f
.PHONY: rm

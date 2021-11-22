PHONE: init
init: ## initialize setup-mac, includes installing brew, ansible
	./init.sh

PHONE: deploy
deploy: ## deploy all settings
	ansible-playbook playbook.yml

PHONE: init
init: ## initialize setup-mac, includes installing brew, ansible
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install ansible
	ansible-galaxy install -r requirements.yml

PHONE: deploy
deploy: ## deploy all settings
	ansible-playbook playbook.yml

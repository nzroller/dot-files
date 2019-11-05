ubuntu: update
	ansible-playbook -K -v -D --tags terraform -i playbooks/inventory playbooks/ubuntu.yml

update:
#	git pull

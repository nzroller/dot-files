ubuntu: update
	ansible-playbook -K -v -D -i playbooks/inventory playbooks/ubuntu.yml

update:
#	git pull

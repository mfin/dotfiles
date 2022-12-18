.POSIX:

default: switch

switch:
	home-manager switch

.PHONY: ansible
ansible:
	cd ansible && ansible-playbook -i ./inventory/homelab/hosts.ini ./k3s.yml

.PHONY: k8s
k8s:
	cd k8s/bootstrap && make

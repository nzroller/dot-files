#! /bin/sh

# Adds Ansible PPA manually (sort of what add-apt-repository does)
tee /etc/apt/sources.list.d/ansible-ubuntu-ansible-trusty.list >/dev/null <<EOF
deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
# deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
EOF
tee /etc/profile.d/ansible.sh >/dev/null <<EOF
export ANSIBLE_LIBRARY=/usr/share/ansible
EOF
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367"
apt-get -y update
apt-get -y install ansible

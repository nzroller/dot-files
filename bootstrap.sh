#! /bin/sh
add-apt-repository --yes ppa:rquillo/ansible
apt-get update
apt-get install ansible
tee /etc/profile.d/ansible.sh >/dev/null <<EOF
export ANSIBLE_LIBRARY=/usr/share/ansible
EOF
chmod a+rx /etc/profile.d/ansible.sh
ansible-galaxy install groover.maven

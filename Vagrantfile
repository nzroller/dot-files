Vagrant.configure("2") do |config|
#  config.vm.network "private_network", type: "dhcp"
  config.ssh.username = "vagrant"
  config.vm.define "ubuntu" do |machine|
    machine.vm.hostname = "ubuntu"
    machine.vm.box = "ubuntu/trusty64"
  end
  config.vm.define "debian" do |machine|
    machine.vm.hostname = "debian"
    machine.vm.box = "puphpet/debian75-x64"

    # this will actually run on all machines in parallel I believe
    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbooks/ubuntu.yml"
      ansible.verbose = "vvvv"
      ansible.limit = "all"
      ansible.groups = {
        "ubuntu" => ["default"]-> Vagrantfile
      }
    end
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.synced_folder "provisioning", "/vagrant/provisioning"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 2
  end

  AWS_ACCESS_KEY = ENV['SMACK_TEST_AWS_ACCESS_KEY']
  AWS_SECRET_KEY = ENV['SMACK_TEST_AWS_SECRET_KEY']
  AWS_REGION = ENV['SMACK_TEST_AWS_REGION']

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "provisioning/site.yml"
    ansible.extra_vars = {
      aws_access_key: AWS_ACCESS_KEY,
      aws_secret_key: AWS_SECRET_KEY,
      aws_region: AWS_REGION
    }
  end
end

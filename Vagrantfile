# Drupal CI Jenkins.
#
# Provides a local development environment for Drupal's Continuous Integration
# Jenkins based platform.
#

Vagrant.configure("2") do |config|
  config.vm.box      = 'puppetlabs/centos-6.5-64-puppet'
  config.vm.hostname = 'jenkins-master.local'

  # Network configured as per bit.ly/1e0ZU1r
  config.vm.network :private_network, :ip => "192.168.50.10"

  # We want to cater for both Unix and Windows.
  config.vm.synced_folder ".", "/vagrant"

  # Virtualbox provider configuration.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--cpus",   "1"]
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :shell, :path => "puppet/provision/base.sh"
  config.vm.provision :shell, :path => "puppet/provision/puppet.sh"
end

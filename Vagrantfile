# Drupal CI Jenkins.
#
# Provides a local development environment for Drupal's Continuous Integration
# Jenkins based platform.
#

domain = 'local'
nodes = [
  {
    :hostname  => 'master',
    :ip        => '192.168.1.52',
    :provision => "puppet/provision/master.sh",
  },{
    :hostname  => 'slave1',
    :ip        => '192.168.1.53',
    :provision => "puppet/provision/slave.sh",
  }
]

Vagrant.configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      # Image.
      node_config.vm.box = 'puppetlabs/centos-6.5-64-puppet'

      # Networking.
      node_config.vm.host_name = node[:hostname] + '.local'
      node_config.vm.network :private_network, :ip => node[:ip]

      # Resources.
      memory = node[:ram] ? node[:ram] : 1024;
      node_config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--name", node[:hostname]]
        vb.customize ["modifyvm", :id, "--memory", memory.to_s]
      end

      # Mounts.
      config.vm.synced_folder ".", "/vagrant"

      # Puppet.
      node_config.vm.provision "shell", path: "puppet/provision/base.sh"
      node_config.vm.provision "shell", path: node[:provision]
    end
  end
end

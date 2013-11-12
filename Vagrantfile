VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "vagrant-mono"

  # The url from where the box box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "http://files.mysite.com/vagrant-mono.box"

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision :shell, :path => "build-support/provisioning/install-nginx.sh"
  config.vm.provision :shell, :path => "build-support/provisioning/install-fastcgi-mono.sh"
  config.vm.provision :shell, :path => "build-support/provisioning/configure-nginx.sh"
  config.vm.provision :shell, :path => "build-support/provisioning/configure-fastcgi-mono.sh"

  config.vm.network :forwarded_port, guest: 80, host: 8093
end

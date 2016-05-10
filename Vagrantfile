# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Use Fedora as a base box.
  config.vm.box = "fedora/23-cloud-base"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Set some common default forwarded ports
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 9292, host: 9292

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Issue a warning if vagrant-vbguest isn't installed or enabled.
  # Guest Additions _have_ to be installed for VB synced folders to work
  unless Vagrant.has_plugin?("vagrant-vbguest")
    puts <<-END.undent
      \e[1m\e[93m
      You don't have the vagrant-vbguest plugin installed or enabled, which automatically installs Guest Additions on VMs
      Shared folders won't work without Guest Additions installed. Install vagrant-vbguest or manually install Guest Additions.
      \e[0m
    END
  end

  # Force using VirtualBox shared folders because Vagrant's Rsync method sucks
  # so incredibly much. This relys on Guest Additions being installed though,
  # which is not the case with the box, so that will need to be done manually.
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #

  config.vm.provision "shell", inline: <<-SHELL
    sudo gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    sudo curl -sSL https://get.rvm.io | bash -s stable --ruby
    source /usr/local/rvm/scripts/rvm
    rvm use --default ruby
    chmod -R 777 /usr/local/rvm
    gem install bundler -N
  SHELL
end

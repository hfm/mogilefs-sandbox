# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "hfm4/centos7"

  config.vm.define :mogfs001 do |c|
    c.vm.network :forwarded_port, guest: 7001, host: 7001 # mogilefsd
    c.vm.network :forwarded_port, guest: 7002, host: 7002 # mogilefsd
    c.vm.network :private_network, ip: "192.168.33.10"
  end

  config.vm.define :storage001 do |c|
    c.vm.network :forwarded_port, guest: 7501, host: 7501 # mogstored
    c.vm.network :private_network, ip: "192.168.33.20"
  end

  config.vm.define :storage002 do |c|
    c.vm.network :forwarded_port, guest: 7501, host: 7502 # mogstored
    c.vm.network :private_network, ip: "192.168.33.21"
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end
end

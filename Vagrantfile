# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "master"   => {"memory" => "2048", "cpu" => "2", "ip" => "100", "image" => "cloud-image/ubuntu-24.04"},
  "node01"   => {"memory" => "1024", "cpu" => "2", "ip" => "110", "image" => "cloud-image/ubuntu-24.04"},
  "node02"   => {"memory" => "1024", "cpu" => "2", "ip" => "120", "image" => "generic/centos8"},
  "registry" => {"memory" => "2048", "cpu" => "2", "ip" => "200", "image" => "cloud-image/ubuntu-24.04"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.docker-dca.example"
      machine.vm.network "private_network", ip: "192.168.1.#{conf["ip"]}"
      machine.vm.synced_folder "C:/Users/welli/Documents", "/tmp/lala"
      machine.vm.synced_folder "./", "/vagrant"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/DCA"]
        vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
        vb.gui = true
      end
      machine.vm.provision "shell", path: "provision.sh"
      machine.vm.provision "shell", inline: "hostnamectl set-hostname #{name}.docker-dca.example"
    end
  end
end

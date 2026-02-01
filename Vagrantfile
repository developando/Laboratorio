# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "python"   => {"memory" => "2048", "cpu" => "4", "ip" => "200", "image" => "centos/stream9"},
  #"node01"   => {"memory" => "1024", "cpu" => "2", "ip" => "110", "image" => "rockylinux/9"},
  #"node02"   => {"memory" => "1024", "cpu" => "2", "ip" => "120", "image" => "rockylinux/9"},
  #"registry" => {"memory" => "2048", "cpu" => "2", "ip" => "200", "image" => "rockylinux/9"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}.docker-dca.example"
      machine.vm.network "private_network", ip: "192.168.1.#{conf["ip"]}"
      machine.vm.synced_folder "/c/Users/welli/repowindows", "/tmp/lala"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        vb.customize ["modifyvm", :id, "--groups", "/Programing"]
        vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
        vb.gui = true
      end
      machine.vm.provision "shell", path: "provision.sh"
      machine.vm.provision "shell", inline: "hostnamectl set-hostname #{name}.docker-dca.example"
    end
  end
end

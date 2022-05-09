Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/8"
  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 4096
  end
  config.vm.provision "shell", path: "buildenv.sh"
  config.vm.define "master", primary: true do |master|
    config.vm.provider :libvirt do |libvirt|
      libvirt.cpus = 4
    end
    # 设置虚拟机的主机名
    master.vm.hostname="master"
    master.vm.network "public_network", :dev => "eno1", :ip => "192.168.1.100"
  end

  config.vm.define "node1" do |node1|
    node1.vm.hostname="node1"
    node1.vm.network "public_network", :dev => "eno1", :ip => "192.168.1.101"
  end
  config.vm.define "node2" do |node2|
    node2.vm.hostname="node2"
    node2.vm.network "public_network", :dev => "eno1", :ip => "192.168.1.102"
  end
  config.vm.define "node3" do |node3|
    node3.vm.hostname="node3"
    node3.vm.network "public_network", :dev => "eno1", :ip => "192.168.1.103"
  end
end

Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/9"
  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 4096
  end
  config.vm.provision "shell", path: "./script/buildenv.sh"
  config.vm.define "master", primary: true do |master|
    config.vm.provider :libvirt do |libvirt|
      libvirt.cpus = 4
    end
    # 设置虚拟机的主机名
    master.vm.hostname="master"
    master.vm.network "public_network", :dev => "enp3s0"
    config.vm.provision "file", source: "./script", destination: "$HOME/script"
  end

  config.vm.define "node1" do |node1|
    node1.vm.hostname="node1"
    node1.vm.network "public_network", :dev => "enp3s0"
  end
  config.vm.define "node2" do |node2|
    node2.vm.hostname="node2"
    node2.vm.network "public_network", :dev => "enp3s0"
  end
  config.vm.define "node3" do |node3|
    node3.vm.hostname="node3"
    node3.vm.network "public_network", :dev => "enp3s0"
  end
end

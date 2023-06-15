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
    master.vm.provision "file", source: "./script", destination: "$HOME/script"
  end

  (1..3).each do |i|
     config.vm.define "node#{i}" do |node|
       node.vm.hostname="node#{i}"
       node.vm.network "public_network", :dev => "enp3s0"
     end
  end

end

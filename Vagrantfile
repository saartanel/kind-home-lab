Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.box_check_update = false
  config.vm.network "public_network"

  config.vm.provision "file", source: "ubuntu/kind/create-cluster.yaml", destination: "/home/vagrant/create-cluster.yaml"

  config.vm.define "kindmaster" do |node|

    node.vm.provider "virtualbox" do |vb|
        vb.name = "kindmaster"
        vb.memory = 2048
        vb.cpus = 2
    end

    node.vm.hostname = "kindmaster"
    node.vm.provision "setup-container-runtime", type: "shell", :path => "ubuntu/docker/setup-hosts.sh"
    node.vm.provision "setup-container-orchestration", type: "shell", :path => "ubuntu/kind/setup-hosts.sh"
    node.vm.provision "setup-kubectl", type: "shell", :path => "ubuntu/kubectl/setup-hosts.sh"

  end

end

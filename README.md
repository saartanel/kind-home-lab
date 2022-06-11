# kind-home-lab

Trying to create a simple kubernetes lab environment in my PC

Currently using:
- Vagrant for vm provisioning
- VirtualBox for vm provider (on Windows)
- Libvirt for vm provider (on Linux/Ubuntu)
- Docker for container runtime
- Kind for kubernetes cluster creation
- Metallb as a loadbalancer
- Haproxy as an ingress controller
- Helm as a package manager for kubernetes

## Prerequisites
- Have Vagrant installed (https://www.vagrantup.com/docs/installation)
- For Windows have VirtualBox installed (https://www.virtualbox.org)
- For Linux/Ubuntu have Libvirt installed (https://ostechnix.com/install-and-configure-kvm-in-ubuntu-20-04-headless-server/)
- Mayhaps have some dhcp in your network for vm ip
## How to use
- Clone the repository and cd to folder
- Exec "vagrant up --provision" to create the virtual machine
- Since we are using a bridged network for dhcp ip, insert a network interface you want the vm to be bridged to on your PC
- Once the provisioning has completed you can access the vm via "vagrant ssh kindmaster"
- To access the kubernetes cluster use the "kubectl" binary
## Delete env
- Exec "vagrant destroy --force" inside the Vagrantfile folder
## ToDo
- Figure out how ingresses work (rewrites and stuff)
- Want to try out ArgoCD
## Credit
Used some of [martivo's](https://github.com/martivo) [kind-lab](https://github.com/martivo/kind-lab) as an example 
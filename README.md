# vagrant-kind

Trying to create a simple kubernetes lab environment in my PC

Currently using:
- Vagrant for vm provisioning
- VirtualBox for vm provider
- Docker for container runtime
- Kind for kubernetes cluster creation
- Metallb as a loadbalancer
- Haproxy as an ingress controller
- Helm as a package manager for kubernetes

## Prerequisites
- Have Vagrant installed (https://www.vagrantup.com/docs/installation)
- Have VirtualBox installed (https://www.virtualbox.org)
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
- Something is broken with the ingresses (showing 404)?
- Want try out ArgoCD
## Credit
Used some of Martivo's architecture as an example (https://github.com/martivo/kind-lab)
# Install Vagrant from:

## Windows

https://www.vagrantup.com/downloads

## Linux (Ubuntu)

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install vagrant

### Install Libvirt for Linux (Ubuntu)

sudo apt install qemu qemu-kvm libvirt-clients libvirt-daemon-system virtinst bridge-utils

sudo apt install libvirt-daemon-system libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base

vagrant plugin install vagrant-libvirt

vagrant plugin install vagrant-mutate
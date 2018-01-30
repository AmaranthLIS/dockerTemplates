#!/bin/bash
sudo apt-get install -y curl unzip

sudo mkdir -p /var/lib/consul
sudo mkdir -p /usr/share/consul
sudo mkdir -p /etc/consul/conf.d

curl -OL https://releases.hashicorp.com/consul/1.0.3/consul_1.0.3_linux_amd64.zip
unzip consul_1.0.3_linux_amd64.zip
sudo mv consul /usr/local/bin/consul
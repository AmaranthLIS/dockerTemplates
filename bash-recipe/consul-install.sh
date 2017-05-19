#!/bin/bash
apt-get install -y curl unzip

mkdir -p /var/lib/consul
mkdir -p /usr/share/consul
mkdir -p /usr/share/consul/ui
mkdir -p /etc/consul/conf.d

curl -OL https://releases.hashicorp.com/consul/0.8.3/consul_0.8.3_linux_amd64.zip
unzip consul_0.8.3_linux_amd64.zip
mv consul /usr/local/bin/consul

curl -OL https://releases.hashicorp.com/consul/0.8.3/consul_0.8.3_web_ui.zip
unzip consul_0.8.3_web_ui.zip
mv dist /usr/share/consul/ui
#!/bin/bash

brew install dnsmasq
sed -i '' -e 's/#listen-address=/listen-address=127.0.0.1/g' $HOMEBREW_PREFIX/etc/dnsmasq.conf
sed -i '' -e 's/#address=\/double-click.net\/127.0.0.1/address=\/.test\/127.0.0.1/g' $HOMEBREW_PREFIX/etc/dnsmasq.conf
sudo mkdir -pv /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/test'
sudo brew services restart dnsmasq

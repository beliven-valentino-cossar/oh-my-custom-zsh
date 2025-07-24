#!/bin/bash

if [[ -z "${HOMEBREW_PREFIX}" ]]; then
  echo "HOMEBREW_PREFIX environment variable not found. Set it accordingly."
else
  brew install dnsmasq
  mkdir -p $HOMEBREW_PREFIX/etc/dnsmasq.d
  echo -e "address=/test/127.0.0.1\nlisten-address=127.0.0.1\ninterface=lo0" > $HOMEBREW_PREFIX/etc/dnsmasq.d/test.conf
  sudo mkdir -pv /etc/resolver
  sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/test'
  sudo brew services restart dnsmasq
fi

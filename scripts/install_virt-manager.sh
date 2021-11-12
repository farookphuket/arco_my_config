#!/bin/bash




sudo pacman -S virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat 

# enable libvirt on boot
sudo systemctl enable libvirtd

# start libvirt now
sudo systemctl start libvirtd


# add user to group
sudo usermod -aG libvirt $USER



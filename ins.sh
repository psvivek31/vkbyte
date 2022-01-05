#!/bin/sh
sudo dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
sudo dnf install docker-c
sudo systemctl enable --now docker
systemctl is-active docker active
sudo systemctl start docker

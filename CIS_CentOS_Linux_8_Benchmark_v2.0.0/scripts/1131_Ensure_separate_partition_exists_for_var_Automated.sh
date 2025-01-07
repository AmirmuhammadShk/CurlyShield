#!/bin/bash
sudofdisk --type=ext4 /dev/sda1
sudo mkfs.ext4 /dev/sda1
sudo mkdir -p /var
echo "/dev/sda1 /var ext4 defaults 0 2" | sudo tee -a /etc/fstab
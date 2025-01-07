#!/bin/bash
sed -i '/Match.*$/i\ngssapapiauthentication no' /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
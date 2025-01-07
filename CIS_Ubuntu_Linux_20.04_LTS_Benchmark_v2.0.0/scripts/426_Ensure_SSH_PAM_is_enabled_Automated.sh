sed -i '/^UsePAM/s/^#*/UsePAM yes/' /etc/ssh/sshd_config
echo "Updating sshd_config file with recommended settings."
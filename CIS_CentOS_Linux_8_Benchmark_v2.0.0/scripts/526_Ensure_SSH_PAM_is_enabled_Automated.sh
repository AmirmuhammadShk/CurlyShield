echo "UsePAM yes" >> /etc/ssh/sshd_config
echo "default_pam_programs yes" >> /etc/ssh/sshd_config
sudo systemctl restart sshd
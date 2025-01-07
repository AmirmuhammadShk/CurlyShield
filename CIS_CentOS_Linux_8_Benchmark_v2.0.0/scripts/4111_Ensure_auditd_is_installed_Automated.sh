if ! dpkg -s auditd &> /dev/null; then
# Install auditd
sudo apt-get update && sudo apt-get install -y auditd
fi
sudo systemctl enable auditd
sudo systemctl start auditd
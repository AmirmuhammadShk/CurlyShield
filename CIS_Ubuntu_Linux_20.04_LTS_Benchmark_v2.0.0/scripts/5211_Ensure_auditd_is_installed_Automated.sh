if ! dpkg -s auditd &> /dev/null; then
# Install auditd
apt install -y auditd
fi
sed -i 's/^(USE_AUGENRULES=).*$/USE_AUGENRULES="yes"/' /etc/sysconfig/auditd
# Restart auditd service to apply the change
systemctl restart auditd
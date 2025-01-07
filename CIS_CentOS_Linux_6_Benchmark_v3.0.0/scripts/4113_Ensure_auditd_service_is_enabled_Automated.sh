chkconfig auditd on
sudo apt-get update && sudo apt-get install -y auditd
sudo auditctl setlogdir /var/log/audit.log
sudo auditctl load 1
dnf install -y rsyslog
systemctl start rsyslog
systemctl enable rsyslog
systemctl status rsyslog | grep Active
firewall-cmd --remove-service=cockpit
firewall-cmd --remove-port=25/tcp
firewall-cmd --runtime-to-permanent
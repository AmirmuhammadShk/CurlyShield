if firewalld is in use; then
firewall-cmd --remove-service cockpit
fi
firewall-cmd --remove-port=25/tcp
firewall-cmd --runtime-to-permanent
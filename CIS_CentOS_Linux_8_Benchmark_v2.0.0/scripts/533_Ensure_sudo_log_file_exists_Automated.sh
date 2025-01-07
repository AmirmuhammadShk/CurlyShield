echo "Defaults logfile=/var/log/sudo.log" | visudo -f
or
echo "Defaults logfile=/var/log/sudo.log" > /etc/sudoers.d/custom
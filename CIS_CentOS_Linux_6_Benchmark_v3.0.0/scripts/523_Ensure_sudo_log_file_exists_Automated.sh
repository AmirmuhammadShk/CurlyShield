sudo visudo -f /etc/sudoers.d/custom_sudoers.conf <<EOF
Defaults logfile="/var/log/sudo.log"
EOF
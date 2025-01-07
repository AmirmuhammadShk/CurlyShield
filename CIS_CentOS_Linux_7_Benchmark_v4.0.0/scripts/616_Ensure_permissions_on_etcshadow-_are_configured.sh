chown root:root /etc/shadow-
chmod 0000 /etc/shadow-
echo "Permissions on /etc/shadow- configured." | tee /var/log/config.log
echo "Edit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /var/log partition." | tee -a /var/log/syslog
echo "Run the following command to remount /var/log with the configured options:" | tee -a /var/log/syslog
echo "mount -o remount /var/log" | tee -a /var/log/syslog
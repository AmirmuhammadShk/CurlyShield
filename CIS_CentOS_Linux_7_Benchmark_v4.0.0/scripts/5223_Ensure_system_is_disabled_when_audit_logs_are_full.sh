sudo sed -i 's/disk_full_action=.*/disk_full_action=halt/' /etc/audit/auditd.conf
sudo sed -i 's/disk_error_action=.*/disk_error_action=halt/' /etc/audit/auditd.conf
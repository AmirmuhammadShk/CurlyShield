sudo echo "admin_space_left_action = halt" | sudo tee -u root /etc/audit/auditd.conf > /dev/null 2>&1
sudo echo "space_left_action = email" | sudo tee -u root /etc/audit/auditd.conf > /dev/null 2>&1
echo "action_mail_acct = root" | sudo tee -u root /etc/audit/auditd.conf > /dev/null 2>&1
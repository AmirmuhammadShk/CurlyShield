sudo sed -i 's|^space_left_action=.*|space_left_action=email|' /etc/audit/auditd.conf
echo "action_mail_acct = root" | sudo tee -a /etc/audit/auditd.conf
echo "admin_space_left_action = halt" | sudo tee -a /etc/audit/auditd.conf
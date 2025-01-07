sed -i '/space_left_action/d' /etc/audit/auditd.conf
echo "space_left_action = email" | sudo tee /etc/audit/auditd.conf
sed -i '/admin_space_left_action/d' /etc/audit/auditd.conf
echo "admin_space_left_action = single" | sudo tee /etc/audit/auditd.conf
sudo apt-get update
sudo apt-get install postfix
sudo systemctl restart auditd
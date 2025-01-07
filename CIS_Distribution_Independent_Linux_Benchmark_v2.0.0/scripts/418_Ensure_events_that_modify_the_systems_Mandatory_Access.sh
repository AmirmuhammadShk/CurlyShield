sudo vi /etc/audit/rules.d/audit.rules
echo '-w /etc/selinux/ -p wa -k MAC-policy' >> /etc/audit/rules.d/audit.rules
echo '-w /usr/share/selinux/ -p wa -k MAC-policy' >> /etc/audit/rules.d/audit.rules
sudo vi /etc/audit/rules.d/audit.rules
echo '-w /etc/apparmor/ -p wa -k MAC-policy' >> /etc/audit/rules.d/audit.rules
echo '-w /etc/apparmor.d/ -p wa -k MAC-policy' >> /etc/audit/rules.d/audit.rules
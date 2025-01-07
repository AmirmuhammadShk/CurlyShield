echo "/etc/audit/rules.d/audit.rules" > /dev/null
if [ $? -ne 0 ]; then
echo "Failed to create /etc/audit/rules.d/audit.rules"
fi
echo "w /etc/group -p wa -k identity" >> /etc/audit/rules.d/audit.rules
echo "w /etc/passwd -p wa -k identity" >> /etc/audit/rules.d/audit.rules
echo "w /etc/gshadow -p wa -k identity" >> /etc/audit/rules.d/audit.rules
echo "w /etc/shadow -p wa -k identity" >> /etc/audit/rules.d/audit.rules
echo "w /etc/security/opasswd -p wa -k identity" >> /etc/audit/rules.d/audit.rules
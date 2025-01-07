vi /etc/audit/rules.d/10-identity.rules
echo "-w /etc/group -p wa -k identity" >> /etc/audit/rules.d/10-identity.rules
echo "-w /etc/passwd -p wa -k identity" >> /etc/audit/rules.d/10-identity.rules
echo "-w /etc/gshadow -p wa -k identity" >> /etc/audit/rules.d/10-identity.rules
echo "-w /etc/shadow -p wa -k identity" >> /etc/audit/rules.d/10-identity.rules
echo "-w /etc/security/opasswd -p wa -k identity" >> /etc/audit/rules.d/10-identity.rules
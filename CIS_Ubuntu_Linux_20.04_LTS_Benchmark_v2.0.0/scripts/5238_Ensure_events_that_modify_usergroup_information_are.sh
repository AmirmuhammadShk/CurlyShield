auditrule -w /etc/group -p wa -k identity >> /etc/audit/rules.d/50-identity.rules
auditrule -w /etc/passwd -p wa -k identity >> /etc/audit/rules.d/50-identity.rules
auditrule -w /etc/gshadow -p wa -k identity >> /etc/audit/rules.d/50-identity.rules
auditrule -w /etc/shadow -p wa -k identity >> /etc/audit/rules.d/50-identity.rules
auditrule -w /etc/security/opasswd -p wa -k identity >> /etc/audit/rules.d/50-identity.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi
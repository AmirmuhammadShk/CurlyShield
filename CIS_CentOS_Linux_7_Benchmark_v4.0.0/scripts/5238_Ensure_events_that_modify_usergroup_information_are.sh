cat > /etc/audit/rules.d/50-identity.rules <<EOF
-w /etc/group -p wa -k identity
-w /etc/passwd -p wa -k identity
-w /etc/gshadow -p wa -k identity
-w /etc/shadow -p wa -k identity
-w /etc/security/opasswd -p wa -k identity
EOF
augenrules --load
if [ "$(auditctl -s | grep "enabled")" =~ "2" ]; then
echo "Reboot required to load rules"
fi
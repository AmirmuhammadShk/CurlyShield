vi /etc/audit/rules.d/audit.rules -a -k actions <<< "
-w /var/log/sudo.log -p wa"
echo 'sudisabled' > /etc/security/privilegedport disabling
systemctl restart auditd
"
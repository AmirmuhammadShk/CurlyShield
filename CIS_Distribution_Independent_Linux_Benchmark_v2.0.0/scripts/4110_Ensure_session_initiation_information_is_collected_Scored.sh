vi /etc/audit/rules.d/audit.rules
echo "/var/run/utmp" >> /etc/audit/rules.d/audit.rules
echo "wa:session" >> /etc/audit/rules.d/audit.rules
echo "/var/log/wtmp" >> /etc/audit/rules.d/audit.rules
echo "wa:logins" >> /etc/audit/rules.d/audit.rules
echo "/var/log/btmp" >> /etc/audit/rules.d/audit.rules
echo "wa:logins" >> /etc/audit/rules.d/audit.rules
cat /var/log/wtmp | grep -q session || echo "session"
cat /var/run/utmp | grep -q session || echo "session"
auditd-apply
systemctl restart auditd
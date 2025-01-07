echo "
-a always,exit -F path=/usr/bin/setfacl -F perm=x -F auid>=1000 -F auid!=unset -k perm_chng
" >> /etc/audit/rules.d/50-priv_cmd.rules
|| echo "ERROR: No UID_MIN defined"
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
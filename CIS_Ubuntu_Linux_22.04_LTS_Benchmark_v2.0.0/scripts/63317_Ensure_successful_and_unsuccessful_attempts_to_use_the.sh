UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "$UID_MIN" ]; then
# Audit rule for successful attempts to use the chacl command with valid UID
printf "
-a always,exit -F path=/usr/bin/chacl -F perm=x -F auid>=${UID_MIN} -F
auid!=unset -k perm_chng
" >> /etc/audit/rules.d/50-perm_chng.rules
# Audit rule for unsuccessful attempts to use the chacl command with invalid UID
printf "
-a always,exit -F path=/usr/bin/chacl -F perm=x -F auid<${UID_MIN} -k perm_chng
" >> /etc/audit/rules.d/50-perm_chng_rules
fi
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
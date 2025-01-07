UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${UID_MIN}" ]; then
# Monitor successful and unsuccessful attempts to use setfacl with audit rules
printf "
-a always,exit -F path=/usr/bin/setfacl -F perm=x -F auid>=${UID_MIN} -F
auid!=unset -k perm_chng
" >> /etc/audit/rules.d/50-perm_chng.rules || \
printf "ERROR: Variable 'UID_MIN' is unset.\n"
# Load audit rules
augenrules --load
# Check if reboot is required to load rules
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
fi
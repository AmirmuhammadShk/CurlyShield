create_audit_rules() {
# Create audit rules for monitoring successful and unsuccessful attempts to use the setfacl command
local UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${UID_MIN}" ]; then
printf "
-a always,exit -F path=/usr/bin/setfacl -F perm=x -F auid>=${UID_MIN} -F
auid!=unset -k perm_chng
" >> /etc/audit/rules.d/50-perm_chng.rules
else
echo "ERROR: Variable 'UID_MIN' is unset."
fi
}
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
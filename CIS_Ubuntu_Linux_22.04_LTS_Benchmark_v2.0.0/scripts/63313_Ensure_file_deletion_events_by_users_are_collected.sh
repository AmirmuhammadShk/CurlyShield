Create audit rules
AUDIT_RULES=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${AUDIT_RULES}" ]; then
printf "
-a always,exit -F arch=b64 -S rename,unlink,unlinkat,renameat -F
auid>=${AUDIT_RULES} -F auid!=unset -F key=delete
-a always,exit -F arch=b32 -S rename,unlink,unlinkat,renameat -F
auid>=${AUDIT_RULES} -F auid!=unset -F key=delete
" >> /etc/audit/rules.d/50-delete.rules || printf "ERROR: Variable 'AUDIT_RULES' is unset.\n"
fi
Load audit rules
augenrules --load
Check if reboot is required.
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi
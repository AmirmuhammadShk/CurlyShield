UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${UID_MIN}" ]; then
printf "
-a always,exit -F arch=b64 -S rename,unlink,unlinkat,renameat -F
auid>=%d -F auid!=unset -F key=delete
" >> /etc/audit/rules.d/50-delete.rules || echo "ERROR: Variable 'UID_MIN' is unset."
fi
if [ "${UID_MIN}" != "" ]; then
printf "
-a always,exit -F arch=b32 -S rename,unlink,unlinkat,renameat -F
auid>=%d -F auid!=unset -F key=delete
" >> /etc/audit/rules.d/50-delete.rules || echo "ERROR: Variable 'UID_MIN' is unset."
fi
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
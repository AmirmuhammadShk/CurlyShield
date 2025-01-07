Create audit rules
edit=/etc/audit/rules.d/50-delete.rules
UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${UID_MIN}" ]; then
# Add rules for 64-bit systems
echo "
-a always,exit -F arch=b64 -S rename,unlink,unlinkat,renameat -F
auid>=${UID_MIN} -F auid!=unset -F key=delete
" >> "$edit" || printf "ERROR: Variable 'UID_MIN' is unset.\n"
# Add rules for 32-bit systems
echo "
-a always,exit -F arch=b32 -S rename,unlink,unlinkat,renameat -F
auid>=${UID_MIN} -F auid!=unset -F key=delete
" >> "$edit" || printf "ERROR: Variable 'UID_MIN' is unset.\n"
fi
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
else
echo "No reboot required to load rules"
fi
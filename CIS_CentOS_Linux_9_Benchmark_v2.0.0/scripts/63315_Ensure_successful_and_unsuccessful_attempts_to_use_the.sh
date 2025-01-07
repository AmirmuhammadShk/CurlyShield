UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -z "$UID_MIN" ]; then
echo "ERROR: Variable 'UID_MIN' is unset."
exit 1
fi
audit_rule=$(printf "
-a always,exit -F path=/usr/bin/chcon -F perm=x -F auid>=${UID_MIN} -F auid!=unset -k perm_chng
" >> /etc/audit/rules.d/50-perm_chng.rules)
if [ $? -ne 0 ]; then
echo "ERROR: Failed to create audit rule"
exit 1
fi
augenrules --load
reboot_required=$(auditctl -s | grep "enabled" | grep "2")
if [[ $reboot_required =~ "2" ]]; then
echo "Reboot required to load rules"
fi
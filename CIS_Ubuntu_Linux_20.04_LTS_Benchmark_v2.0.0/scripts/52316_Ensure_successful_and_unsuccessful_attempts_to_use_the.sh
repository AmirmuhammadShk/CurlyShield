UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -z "$UID_MIN" ]; then
echo "ERROR: Variable 'UID_MIN' is unset."
exit 1
fi
echo "-a always,exit -F path=/usr/bin/setfacl -F perm=x -F auid>=${UID_MIN} -F auid!=unset -k perm_chng" >> /etc/audit/rules.d/50-perm_chng.rules
augenrules --load || { echo "Error loading audit rules"; exit 1; }
if [ "$(auditctl -s | grep "enabled" | awk '{print $1}')" == "2" ]; then
printf "Reboot required to load rules\n"
fi
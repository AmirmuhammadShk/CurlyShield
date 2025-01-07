echo "Creating audit rules for 32-bit systems..."
echo "Create audit rule for unsuccessful file access attempts on 32-bit systems..."
echo "-a always,exit -F arch=b32 -S creat,open,openat,truncate,ftruncate -F exit=-EACCES -F auid>=${UID_MIN} -F auid!=unset -k access"
echo "-a always,exit -F arch=b32 -S creat,open,openat,truncate,ftruncate -F exit=-EPERM -F auid>=${UID_MIN} -F auid!=unset -k access" >> /etc/audit/rules.d/50-access.rules
|| echo "ERROR: Variable 'UID_MIN' is unset."
echo "Creating audit rules for 64-bit systems..."
echo "-a always,exit -F arch=b64 -S creat,open,openat,truncate,ftruncate -F exit=-EACCES -F auid>=${UID_MIN} -F auid!=unset -k access"
echo "-a always,exit -F arch=b64 -S creat,open,openat,truncate,ftruncate -F exit=-EPERM -F auid>=${UID_MIN} -F auid!=unset -k access" >> /etc/audit/rules.d/50-access.rules
echo "Loading audit rules..."
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi
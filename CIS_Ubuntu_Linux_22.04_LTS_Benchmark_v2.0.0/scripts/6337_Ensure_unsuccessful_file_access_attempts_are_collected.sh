Create audit rules
Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension,
with the relevant rules to monitor unsuccessful file access attempts.
UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
-a always,exit -F arch=b64 -S creat,open,openat,truncate,ftruncate -F exit=- -F auid>=${UID_MIN} -F auid!=unset -k access
-a always,exit -F arch=b32 -S creat,open,openat,truncate,ftruncate -F exit=- -F auid>=${UID_MIN} -F auid!=unset -k access
augenrules --load || printf "ERROR: Failed to load audit rules\n"
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi
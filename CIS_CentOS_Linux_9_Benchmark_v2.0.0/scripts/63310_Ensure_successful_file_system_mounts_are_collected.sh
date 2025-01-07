Create audit rules
Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension,
with the relevant rules to monitor successful file system mounts.
```bash
UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "$UID_MIN" ]; then
printf "%s\n" \
"-a always,exit -F arch=b32 -S mount -F auid>=$UID_MIN -F auid!=unset -k mounts" >> /etc/audit/rules.d/50-mounts.rules
printf "%s\n" \
"-a always,exit -F arch=b64 -S mount -F auid>=$UID_MIN -F auid!=unset -k mounts" >> /etc/audit/rules.d/50-mounts.rules
fi
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi
```
Note: This script assumes that the `/etc/login.defs` file exists and has a `UID_MIN` value set. If this is not the case, you may need to add additional logic to handle this situation.
Also, make sure to replace the `/etc/audit/rules.d/50-mounts.rules` path with the actual location where you want to store your rules.
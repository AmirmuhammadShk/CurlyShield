Create audit rules
Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension,
with the relevant rules to monitor successful file system mounts.
64 Bit systems
auid>=1000 -F arch=b32 -S mount
auid!=unset -k mounts
auid>=1000 -F arch=b64 -S mount
auid!=unset -k mounts
Load audit rules
augenrules --load
Check if reboot is required.
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then echo "Reboot required to load rules"; fi
#!/bin/bash
Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension,
with the relevant rules to monitor scope changes for system administrators.
Example:
printf '%s\n' "-w /etc/sudoers -p wa -k scope" "-w /etc/sudoers.d -p wa -k scope" >> /etc/audit/rules.d/50-scope.rules
Merge and load the rules into active configuration using augenrules:
augenrules --load
Check if reboot is required:
if auditctl -s | grep "enabled" | awk '{print $1}'; then
printf "Reboot required to load rules\n"
fi
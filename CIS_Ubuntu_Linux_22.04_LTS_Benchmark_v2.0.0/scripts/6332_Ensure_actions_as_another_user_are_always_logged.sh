echo "# Rule 1: Monitor elevated privileges for user emulation
-a always,exit -F arch=b64 -C euid!=uid -F auid!=unset -S execve -k user_emulation" >> /etc/audit/rules.d/50-user_emulation.rules
echo "# Rule 2: Monitor elevated privileges for user emulation (32-bit architecture)
-a always,exit -F arch=b32 -C euid!=uid -F auid!=unset -S execve -k user_emulation" >> /etc/audit/rules.d/50-user_emulation.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
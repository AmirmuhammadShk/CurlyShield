if [ -n "${UID_MIN}" ]; then
printf "
-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=unset -k mounts
" >> /etc/audit/rules.d/50-perm_mod.rules || echo "ERROR: Variable 'UID_MIN' is unset."
fi
if [ -n "${UID_MIN}" ]; then
printf "
-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=unset -k mounts
" >> /etc/audit/rules.d/50-perm_mod.rules || echo "ERROR: Variable 'UID_MIN' is unset."
fi
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
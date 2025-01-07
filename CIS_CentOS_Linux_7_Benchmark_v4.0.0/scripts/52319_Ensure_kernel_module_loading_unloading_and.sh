UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${UID_MIN}" ]; then
printf "
-a always,exit -F arch=b64 -S init_module,finit_module,delete_module,create_module,query_module -F auid>=%s -F auid!=unset -k kernel_modules
" "$UID_MIN"
>> /etc/audit/rules.d/50-kernel_modules.rules
else
printf "ERROR: Variable 'UID_MIN' is unset.\n"
fi
augenrules --load
if [ $(auditctl -s | grep "enabled") == *"2"* ]; then
printf "Reboot required to load rules\n"
fi
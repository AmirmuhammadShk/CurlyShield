UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -z "$UID_MIN" ]; then
printf "ERROR: Variable 'UID_MIN' is unset.\n"
exit 1
fi
auditctl -a always,exit -F arch=b64 -S init_module,finit_module,delete_module,create_module,query_module -F auid>=${UID_MIN} -F auid!=unset -k kernel_modules
if [ $? -ne 0 ]; then
printf "ERROR: Failed to create audit rule for kernel module modification\n"
exit 1
fi
auditctl -a always,exit -F path=/usr/bin/kmod -F perm=x -F auid>=${UID_MIN} -F auid!=unset -k kernel_modules
if [ $? -ne 0 ]; then
printf "ERROR: Failed to create audit rule for kmod binary execution\n"
exit 1
fi
augenrules --load
if [ $? -ne 0 ]; then
printf "ERROR: Failed to load audit rules\n"
exit 1
fi
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
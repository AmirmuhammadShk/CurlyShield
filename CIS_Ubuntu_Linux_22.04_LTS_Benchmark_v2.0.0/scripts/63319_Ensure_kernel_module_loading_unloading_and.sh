UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${UID_MIN}" ]; then
printf "%s\n" \
"-a always,exit -F arch=b64 -S init_module,finit_module,delete_module -F " \
"auid>=${UID_MIN} -F auid!=unset -k kernel_modules" | \
auditctl -A
printf "%s\n" \
"-a always,exit -F path=/usr/bin/kmod -F perm=x -F auid>=${UID_MIN} -F " \
"auid!=unset -k kernel_modules" | \
auditctl -A
else
echo "ERROR: Variable 'UID_MIN' is unset."
fi
auditctl -m
if [ $(auditctl -s | grep "enabled") == "2" ]; then
echo "Reboot required to load rules"
fi
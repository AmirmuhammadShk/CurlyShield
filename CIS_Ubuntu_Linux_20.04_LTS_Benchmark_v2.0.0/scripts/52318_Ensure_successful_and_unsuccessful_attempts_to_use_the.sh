UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -z "$UID_MIN" ]; then
echo "ERROR: Variable 'UID_MIN' is unset."
fi
-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=${UID_MIN} -F auid!=unset -k usermod
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi
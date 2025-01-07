AUDIT_RULE_FILE="/etc/audit/rules.d/50-privileged.rules"
NEW_DATA=()
findmnt -n -l -k -it $(awk '/nodev/ { print $2 }' /proc/filesystems | grep -Pv "noexec|nosuid" | awk '{print $1}' ) | \
while read partition; do
find "${partition}" -xdev -perm /6000 -type f | awk -v UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs) '{print "-a always,exit -F path=" $0 " -F perm=x -F auid>="UID_MIN" -F auid!=unset -k privileged"}' | readarray -t DATA;
for ENTRY in "${DATA[@]}"; do
NEW_DATA+=("${ENTRY}")
done
done
readarray &> /dev/null -t OLD_DATA < "${AUDIT_RULE_FILE}"
COMBINED_DATA=( "${OLD_DATA[@]}" "${NEW_DATA[@]}" )
printf '%s\n' "${COMBINED_DATA[@]}" | sort -u > "${AUDIT_RULE_FILE}"
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n";
fi
partitions=$(findmnt -n -l -k -it $(awk '/nodev/ { print $2 }' /proc/filesystems | grep -Pv "noexec|nosuid") | awk '{print $1}')
if [ "$partitions" != "$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)" ]; then
echo "Special mount points are not in /etc/audit/rules.d file. Please adjust PARTITION variable."
exit 1;
fi
augenrules --load
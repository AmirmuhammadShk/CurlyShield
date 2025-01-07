AUDIT_RULE_FILE="/etc/audit/rules.d/50-privileged.rules"
NEW_DATA=()
PARTITION=$(findmnt -n -l -k -it $(awk '/nodev/ { print $2 }' /proc/filesystems | paste -sd,) | grep -Pv "noexec|nosuid" | awk '{print $1}')
for ENTRY in $(find "$PARTITION" -xdev -perm /6000 -type f); do
NEW_DATA+=("-a always,exit -F path=$ENTRY -F perm=x -F auid>=$UID_MIN -F auid!=unset -k privileged")
done
OLD_DATA=$(augenrules --get-rules)
COMBINED_DATA=("${OLD_DATA[@]}" "${NEW_DATA[@]}")
printf '%s\n' "${COMBINED_DATA[@]}" | sort -u > "$AUDIT_RULE_FILE"
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
augenrules --load
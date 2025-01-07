UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ ! -d /etc/audit/rules.d ]; then
mkdir -p /etc/audit/rules.d
fi
OLD_DATA=$(cat /etc/audit/rules.d/*.rules)
PARTITION=$(findmnt -n -l -k -it $(awk '/nodev/ { print $2 }' /proc/filesystems | paste -sd,) | grep -Pv "noexec|nosuid" | awk '{print $1}')
NEW_DATA=()
for file in "${PARTITION}"/-; do
readarray -t DATA < <(find "$file" -xdev -perm /6000 -type f | awk -v UID_MIN=${UID_MIN} '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>="UID_MIN" -F auid!=unset -k privileged"}')
for ENTRY in "${DATA[@]}"; do
NEW_DATA+=("${ENTRY}")
done
done
COMBINED_DATA=($(echo "$OLD_DATA" | sort -u))
COMBINED_DATA+=($(printf '%s\n' "${NEW_DATA[@]}" | sort -u))
echo "${COMBINED_DATA[@]}" > /etc/audit/rules.d/50-privileged.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
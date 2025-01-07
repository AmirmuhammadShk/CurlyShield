UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -z "${UID_MIN}" ]; then
echo "ERROR: Variable 'UID_MIN' is unset."
exit 1
fi
rules=()
while IFS= read -r line; do
if [[ $line =~ ^-a ]]; then
rule="-a always,exit"
perms=$(echo "$line" | grep -oE '-F perm=x' | cut -d '=' -f2)
auid=$(echo "$line" | grep -oE '-F auid>=${UID_MIN}' | cut -d '=' -f2 | tr -d '>')
rule+=" $perms"
if [ ${#auid} -gt 0 ]; then
rule+=" -F auid=${auid}"
fi
if [ -n "${auid}" ] && [[ $line =~ -F auid!=unset ]]; then
rule+=" -F auid!=unset"
else
rule+=" -F auid=unset"
fi
rule+=" -k usermod"
fi
rules+=("$rule")
done < <(echo "{ [ -n \"${UID_MIN}\" ] && ...}")
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
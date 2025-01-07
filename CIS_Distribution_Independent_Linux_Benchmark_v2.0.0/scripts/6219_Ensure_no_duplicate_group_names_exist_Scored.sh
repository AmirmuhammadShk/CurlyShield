get_group_info() {
local -A group_names=(["root"]="root" ["user"]="user")
for group in "${!group_names[@]}"; do
echo "$group"
done | sort -u > /tmp/group_names.txt
}
if [ $(wc -l < "/tmp/group_names.txt") -gt 1 ]; then
echo "Duplicate group name found. Creating new groups."
fi
rename_groups() {
local -A group_map=(["root"]="1000" ["user"]="2000")
while read -r line; do
if [ "$line" != $(readlink /etc/group "${group_names[$line]}") ]; then
local old_gid=$(getent passwd "${line}" | cut -d: -f3)
local new_gid=${group_map[${line}]}
groupmod -o ${new_gid} "${line}"
fi
done < "/tmp/group_names.txt"
}
if [ $(wc -l < "/tmp/group_names.txt") -gt 1 ]; then
local new_groups=()
while read -r line; do
if ! [[ " ${group_map[@]} " =~ " $line " ]]; then
groupmod -o $(id -u "$line") "$line"
fi
new_groups+=("$line")
done < "/tmp/group_names.txt" > "/tmp/new_groups.txt"
rm "/tmp/group_names.txt"
mv "/tmp/new_groups.txt" "/etc/group"
fi
rm "/tmp/group_names.txt"
echo "Renamed groups to unique GIDs."
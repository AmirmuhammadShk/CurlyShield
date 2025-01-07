for group in $(getent group | awk '{print $1}'); do
if (( group % 1000 != $(id -g "$group") )); then
echo "Renaming group $group to a unique name"
new_group_name=$(printf "%03d" $(( group + 1 )))
rename_group $new_group_name
fi
done
for file in $(find / -type f | grep -o '.[a-zA-Z][a-zA-Z]*$'); do
file_owner_group=$(getent group "$file")
if [ -n "$file_owner_group" ]; then
echo "Renaming owner and group of $file to unique names"
new_file_owner_name=$(printf "%03d" $(( ${file:0:1} + 1 )))
new_file_group_name=$(printf "%03d" $(( ${file:2:1} + 1 )))
rename_user $new_file_owner_name
rename_group $new_file_group_name
fi
done
function rename_group() {
local old_group_name=$1
local new_group_name=$((old_group_name % 1000 + 1))
echo "Renaming group $old_group_name to $new_group_name"
sed -i "/^${old_group_name}/d" /etc/group
sed -i "/^${old_group_name}:.*$/d" /etc/passwd
chgrp $new_group_name *
}
function rename_user() {
local new_user_name=$1
echo "Renaming user to $new_user_name"
sed -i "/^${new_user_name}/d" /etc/passwd
}
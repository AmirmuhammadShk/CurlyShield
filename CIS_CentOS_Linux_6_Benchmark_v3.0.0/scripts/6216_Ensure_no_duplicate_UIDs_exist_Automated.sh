unique_uids=($(getent group | cut -d: -f4 | sort -u))
missing_owners=( $(find / -type f -exec stat -c "%u" {} \; ) )
uid_map=()
for uid in "${unique_uids[@]}"; do
if [ -n "$(find / -type f -exec stat -c "%u" {} \; | grep "$uid")" ]; then
echo "UID $uid is not present"
continue
fi
owner=$(getent passwd | cut -d: -f1 | grep "$uid")
if [ -z "$owner" ]; then
uid_map+=("$uid:$uid")
else
for file in "${missing_owners[@]}"; do
if [ $(stat -c "%u" "$file") -eq "$uid" ]; then
echo "File $file belongs to UID $uid"
find "$file" -type f -exec chown "$owner:$uid" {} \;
fi
done
fi
done
for pair in "${uid_map[@]}"; do
uid=$pair%%:*; owner=pair#*
echo "Mapping UID $uid to $owner"
done
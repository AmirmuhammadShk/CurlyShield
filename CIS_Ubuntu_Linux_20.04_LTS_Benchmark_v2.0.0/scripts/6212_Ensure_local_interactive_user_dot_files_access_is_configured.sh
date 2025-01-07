for user in $(awk -F: '$(NF) ~ "nologin" { print $1 }' /etc/passwd); do
home_dir=$(awk -v pat="$user" -F: '$(NF) == "'"$user"'"' '/etc/passwd' | cut -d: -f6)
for file in $(find "$home_dir" -xdev -type f -name '.*' -print0); do
if [[ "${file}" =~ \..* ]]; then
permissions=$(stat -Lc '%#a' "$file")
if (( $permissions & 0777 )); then
echo "File: \"$file\" is mode: \"$permissions\" and should be mode: \"$(printf '%o' $(( 0777 & ~$permissions )))\" or more restrictive"
chmod "$(printf '%o' $(( 0777 & ~$permissions )))" "$file"
fi
fi
done
done
for user in $(awk -F: '$(NF) ~ "nologin" { print $1 }' /etc/passwd); do
home_dir=$(awk -v pat="$user" -F: '$(NF) == "'"$user"'"' '/etc/passwd' | cut -d: -f6)
for file in $(find "$home_dir" -xdev -type f -name '.*' -print0); do
if [[ "${file}" =~ \..* ]]; then
owner=$(stat -Lc '%U' "$file")
if [ "$owner" != "$user" ]; then
echo "File: \"$file\" owned by: \"$owner\" and should be owned by \"$user\""
chown "$user" "$file"
fi
fi
done
done
for user in $(awk -F: '$(NF) ~ "nologin" { print $1 }' /etc/passwd); do
home_dir=$(awk -v pat="$user" -F: '$(NF) == "'"$user"'"' '/etc/passwd' | cut -d: -f6)
primary_group=$(id -gn "$user")
for file in $(find "$home_dir" -xdev -type f -name '.*' -print0); do
if [[ "${file}" =~ \..* ]]; then
group=$(stat -Lc '%G' "$file")
if [ "$group" != "$primary_group" ]; then
echo "File: \"$file\" group owned by: \"$group\" and should be group owned by \"$primary_group\""
chgrp "$primary_group" "$file"
fi
fi
done
done
for user in $(awk -F: '$(NF) ~ "nologin" { print $1 }' /etc/passwd); do
home_dir=$(awk -v pat="$user" -F: '$(NF) == "'"$user"'"' '/etc/passwd' | cut -d: -f6)
for file in $(find "$home_dir" -xdev -type f -name '.*' -print0); do
if [[ "${file}" =~ \.(forward|rhost)$ ]]; then
echo "File: \"$file\" exists"
echo "Please investigate and manually delete $file"
fi
done
done
asize=$(awk -F: '$(NF) ~ "nologin" { print $(NF) }' /etc/passwd | wc -l)
if (( asize > 0 )); then
echo "Number of local interactive users: $asize"
else
echo "No local interactive users found."
fi
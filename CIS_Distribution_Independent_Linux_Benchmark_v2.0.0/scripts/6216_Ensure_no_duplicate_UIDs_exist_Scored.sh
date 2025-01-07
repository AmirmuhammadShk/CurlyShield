while IFS= read -r line; do
if [[ $line =~ ^uid=([0-9]+)$ ]]; then
uid=$(echo "${BASH_REMATCH[1]}" | tr -d ' ')
if id -u "$uid" &> /dev/null; then
echo "Duplicate UID found: $uid"
fi
fi
done < <(getent passwd)
for uid in $(id -u | sort -nu); do
for file in $(find / -type f -user "$uid" -print); do
echo "File $file owned by UID $uid, expected to be $uid"
done
done
for uid in $(id -u | sort -nu); do
if id -u "$uid" &> /dev/null; then
user=$(getent passwd "$uid" | cut -d: -f1)
for file in $(find / -type f -user "$uid" -print); do
chown "$user:$uid" "$file"
done
fi
done
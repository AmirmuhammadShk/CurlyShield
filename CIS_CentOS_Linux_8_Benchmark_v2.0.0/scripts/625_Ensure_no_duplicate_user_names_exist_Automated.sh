duplicates=$(getent passwd | awk -F: '{if ($7 in $5) {print $5}}' | sort -u)
while IFS= read -r dup; do
new_uid=$((rand() % 1000000))
new_username="user$new_uid"
while [ -e "/etc/passwd" ] && grep -q "$dup " /etc/passwd; do
new_uid=$((rand() % 1000000))
new_username="user$new_uid"
done
sed -i "/$dup/ s/$dup/$new_username/" /etc/passwd
useradd $new_username --uid $new_uid
done < <(echo "$duplicates")
echo "Renamed $(wc -l <<< "$duplicates") duplicate usernames"
cat /etc/passwd | grep -E 'user[0-9]+|UID=[0-9]+'
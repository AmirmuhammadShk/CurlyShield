while read -r line; do
if echo "$line" | grep -qE '(^|[[:space:]])UID=([[:alnum:]]+) ([[:alnum:]]+)$' && ! echo "$line" | grep -q '^UID='; then
username=$(echo "${BASH_REMATCH[2]}" | cut -d'-' -f1)
if [ -n "$username" ]; then
echo "Duplicate user name detected: $username. Please remove or rename the user account."
fi
fi
done < /etc/passwd
echo > /proc/self/uid_map
while read -r line; do
if echo "$line" | grep -q '^UID=([[:alnum:]]+)$'; then
user_name=$(echo "${BASH_REMATCH[1]}" | cut -d'-' -f2-)
new_uid=$(( RANDOM % 65536 ))
echo "$new_uid $user_name"
fi
done < /etc/passwd
echo > /tmp/old_passwd
while read -r line; do
if echo "$line" | grep -qE '^UID=([[:alnum:]]+) (.+)$'; then
echo "${BASH_REMATCH[1]} ${BASH_REMATCH[2]}"
else
echo "$line"
fi
done < /etc/passwd > /tmp/old_passwd
mv /tmp/old_passwd /etc/passwd
while read -r line; do
if echo "$line" | grep -qE '^GROUP=([[:alnum:]]+) ([[:alnum:]]+)$'; then
group_name=$(echo "${BASH_REMATCH[2]}" | cut -d'-' -f1)
while read -r line2; do
if echo "$line2" | grep -qE '^UID=([[:alnum:]]+) $group_name$'; then
group_id=$(echo "${BASH_REMATCH[1]}" | cut -d'-' -f2-)
break
fi
done < /etc/group
echo "$line" | sed 's/.*GROUP=\(.*\).*\([[:alnum:]]+\).*/GROUP=\1 NEWID \2/'
else
echo "$line"
fi
done < /etc/passwd
echo > /tmp/new_uids
while read -r line; do
if echo "$line" | grep -qE '^NEWID=([[:alnum:]]+) $'; then
group_id=$(echo "${BASH_REMATCH[1]}" | cut -d'-' -f2-)
while read -r line2; do
if echo "$line2" | grep -qE '^GROUP=([[:alnum:]]+) \1$'; then
echo "New UIDs set for group $group_id."
break
fi
done < /etc/group
else
echo "$line"
fi
done < /tmp/new_uids > /etc/group
rm -rf /tmp/new_uids /proc/self/uid_map /tmp/old_passwd
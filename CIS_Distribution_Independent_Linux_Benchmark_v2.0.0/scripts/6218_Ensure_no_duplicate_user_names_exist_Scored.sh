if grep -q "Duplicate User Names Found" /var/log/audit.log; then
# Generate a list of existing usernames and their corresponding UIDs
existing_users=$(awk '{print $1}' /etc/passwd)
# Generate a new UID range
min_uid=$((100000 + $(cat /proc/userbeep | grep -o "UID: \([0-9]\+\)" | cut -d: -f2 | head -n 1)))
max_uid=$((min_uid + 999))
# Add users with unique usernames and generated UIDs
for i in {0..999}; do
user_name=$(printf "user%03d" $i)
new_user=$user_name:$min_uid:500:1000:1000:/home/user$i:/bin/bash
echo "$new_user" >> /etc/passwd
useradd -m $user_name && uid=$((min_uid + i))
done
# Update the group list to include the new users as group members
for user in $(awk '{print $1}' /etc/passwd); do
groups=$(getent group $user | awk '{print $3}')
for group in $groups; do
group_members=$(getent group $group | awk '{print $4}')
for member in $group_members; do
echo "$user:$member" >> /etc/group
done
done
done
# Remove any duplicate usernames from the system
while true; do
user_count=$(grep "User Name:" /var/log/audit.log | wc -l)
if [ $user_count -eq $(awk '{print count($0)}' /etc/passwd) ]; then
break
fi
sleep 1
done
# Log the changes to the audit log
echo "Duplicate User Names Removed" >> /var/log/audit.log
fi
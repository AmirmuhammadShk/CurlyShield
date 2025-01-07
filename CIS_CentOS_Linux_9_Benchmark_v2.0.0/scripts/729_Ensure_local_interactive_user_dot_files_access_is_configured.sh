find /home -type d -exec chmod 700 {} \; | while read file; do
find "$file" -maxdepth 1 -type f -exec chmod 600 {} \;
done
for user in $(awk -F: '$3 != "nologin"' /etc/passwd | cut -d: -f1); do
for file in /home/$user/*; do
if [ -f "$file" ]; then
user_id=$(id -u $user)
group_id=$(id -g $user)
chown $user_id:$group_id "$file"
fi
done
done
for user in $(awk -F: '$3 != "nologin"' /etc/passwd | cut -d: -f1); do
for file in /home/$user/*; do
if [ -f "$file" ]; then
user_id=$(id -u $user)
group_id=$(awk -F: '$2 == "'$user'"' /etc/passwd | cut -d: -f3)
chgrp $group_id "$file"
fi
done
done
find /home -type f -name '.forward' -print0 | xargs -0 rm -rf
find /home -type f -name '.rhost' -print0 | xargs -0 rm -rf
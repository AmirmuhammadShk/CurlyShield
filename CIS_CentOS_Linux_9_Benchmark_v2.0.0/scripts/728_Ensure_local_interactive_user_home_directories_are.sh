while IFS= read -r l_user; do
if [ ! -d "/home/$l_user" ]; then
mkdir "/home/$l_user"
fi
done < "/etc/passwd"
for user in $(getent passwd | awk -F: '$1 != "nologin" {print $1}'); do
chown "$user" "/home/$user"
chmod g-w,o-rwx "/home/$user"
done
while IFS= read -r l_user; do
if [ ! -d "/home/$l_user" ]; then
continue
fi
chown "$l_user" "/home/$l_user"
done < "/etc/passwd"
if getent passwd | awk -F: '$1 != "nologin" {print $1}' | wc -l > 10000; then
echo -e "\n  ** INFO **\n  - $(getent passwd | awk -F: '$1 != "nologin" {print $1} | wc -l') Local interactive users found on the system\n"
else
echo -e "\n  No modification needed to local interactive users home directories"
fi
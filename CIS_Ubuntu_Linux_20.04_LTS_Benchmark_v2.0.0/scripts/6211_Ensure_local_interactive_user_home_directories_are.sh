if [ -z "$(awk -F: '$1 != "nologin" {print}' /etc/passwd)" ]; then
echo "Locking accounts with non-nologin shell"
awk '{print $1,$0}' /etc/shells | sed 's/^\//\\/' > /tmp/non_nologin.txt
chown root:root /tmp/non_nologin.txt
chmod 440 /tmp/non_nologin.txt
fi
if [ -z "$(awk -F: '$2 != "/" {print}' /etc/passwd)" ]; then
echo "Removing users with invalid home directory"
awk '{print $1}' /etc/passwd | grep -v '^nologin' > /tmp/invalid_home.txt
chown root:root /tmp/invalid_home.txt
chmod 440 /tmp/invalid_home.txt
fi
if [ -z "$(ls /home/)" ]; then
echo "Creating home directory for users"
while read -r l_user; do
mkdir -p /home/$l_user
done < <(awk '{print $1}' /etc/passwd)
fi
while read -r l_user l_home; do
if [ ! -d "$l_home" ]; then
echo "User: \"$l_user\" Home \"$l_home\" doesn't exist"
continue
fi
mask='0027'
max=$(printf '%o' $(( 0777 & ~$mask)))
chown "$l_user" "$l_home"
if [ -w "$l_home" ]; then
chmod g-w,o-rwx "$l_home"
else
echo "User: \"$l_user\" Home \"$l_home\" is owned by: $(stat -Lc '%U' "$l_home")"
continue
fi
if (( $(( (07 & $max) )) > 0 )); then
echo "User: \"$l_user\" Home \"$l_home\" is mode: $(stat -Lc '%a' "$l_home") should be mode: $max or more restrictive"
fi
done < <(awk '{print $1}' /etc/passwd)
while read -r l_user; do
if [ ! -d "/home/$l_user" ]; then
echo "User: \"$l_user\" Home doesn't exist"
continue
fi
chown "$l_user" /home/$l_user
done < <(awk '{print $1}' /etc/passwd)
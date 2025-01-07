if [ -d "/sbin" ]; then
if [ ! -f "/sbin/nologin" ]; then
echo "Replaced /sbin/nologin with /usr/sbin/nologin"
mv "/sbin/nologin" "/usr/sbin/nologin"
fi
fi
for user in $(getent passwd | cut -d: -f1); do
if [ "$(getent group $user)" != "x" ]; then
echo "$user has group writable permissions"
fi
if [ ! -r "/home/$user/.bashrc" ] && [ ! -w "/home/$user/.bashrc" ]; then
echo "/home/$user/.bashrc is not writable"
fi
done
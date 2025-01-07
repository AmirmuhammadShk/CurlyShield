{
chmod u-x,og-rwx /etc/ssh/sshd_config;
chown root:root /etc/ssh/sshd_config;
find /etc/ssh/sshd_config.d -type f -print0 | while IFS= read -r -d $'\0' l_file; do
if [ -e "$l_file" ]; then
chmod u-x,og-rwx "$l_file";
chown root:root "$l_file";
fi
done
}
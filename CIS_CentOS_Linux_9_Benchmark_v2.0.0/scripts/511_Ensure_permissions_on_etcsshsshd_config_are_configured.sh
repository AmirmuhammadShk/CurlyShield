chmod u-x,og-rwx /etc/ssh/sshd_config
chown root:root /etc/ssh/sshd_config
find /etc/ssh/sshd_config.d -type f | while IFS= read -r file; do
chmod u-x,og-rwx "$file"
chown root:root "$file"
done
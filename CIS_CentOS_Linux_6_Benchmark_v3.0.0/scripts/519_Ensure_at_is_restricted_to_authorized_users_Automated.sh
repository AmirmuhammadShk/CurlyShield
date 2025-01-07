rm -f /etc/at.deny 2>/dev/null
touch /etc/at.allow && \
chown root:root /etc/at.allow && \
chmod u-x,og-rwx /etc/at.allow
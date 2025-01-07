if command -v at &> /dev/null; then
# Create /etc/at.allow file if it doesn't exist, change ownership to root:daemon or root, and set permissions
touch /etc/at.allow || true
chown root:daemon || echo "Failed to change ownership of /etc/at.allow" >&2
chmod u-x,g-wx,o-rwx /etc/at.allow
# Check if /etc/at.deny exists, change ownership to root:daemon or root, and set permissions
if [ -e "/etc/at.deny" ]; then
chown root:daemon || echo "Failed to change ownership of /etc/at.deny" >&2
chmod u-x,g-wx,o-rwx /etc/at.deny
fi
fi
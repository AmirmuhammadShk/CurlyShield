find ~ -type f -name ".netrc" | xargs rm -i "Confirm"
echo "User found .netrc file(s)" | sendmail <username> # Replace with desired recipient
if [ -f /sbin/nologin ]; then
if ! grep -q "/usr/sbin/nologin" /etc/secure shells; then
echo "Replace /sbin/nologin with /usr/sbin/nologin"
echo "/sbin/nologin" > /usr/sbin/nologin # Create new file and copy from /sbin
chmod 644 /usr/sbin/nologin # Set permissions
fi
fi
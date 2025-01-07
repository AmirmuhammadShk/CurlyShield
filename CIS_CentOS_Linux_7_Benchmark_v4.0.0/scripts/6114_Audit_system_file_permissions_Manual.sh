audit -f | grep -q "system file permissions" || {
echo "Audit failed, fixing system file permissions..."
# Change directory to /etc and change ownership to root:root
chown -R root:root /etc
}
audit -f
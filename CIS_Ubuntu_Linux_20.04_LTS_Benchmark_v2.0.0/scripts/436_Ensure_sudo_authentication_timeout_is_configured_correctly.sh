if [ $(grep -o 'timestamp_timeout=' /etc/sudoers | wc -l) -eq 0 ]; then
# If not, edit the file using visudo and modify timestamp_timeout to 15 minutes or less
visudo -f /etc/sudoers || { echo "Failed to update sudoers"; exit 1; }
sed -i 's/^timestamp_timeout.*$/timestamp_timeout=15/' /etc/sudoers
fi
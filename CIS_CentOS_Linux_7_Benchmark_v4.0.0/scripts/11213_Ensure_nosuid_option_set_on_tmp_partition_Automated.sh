if [ -d /tmp ]; then
# Edit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /tmp partition
echo "Adding nosuid option to /tmp in fstab" >> /var/log/commands.log
sed -i 's/defaults,rw,nosuid/nodev,noexec,rw,nosuid,relatime/g' /etc/fstab
fi
echo "Remounting /tmp is not necessary" >> /var/log/commands.log
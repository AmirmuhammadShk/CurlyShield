if [ -d /home ]; then
echo "/home already exists"
else
# Create custom partition for /home during installation
echo "Creating custom partition for /home..."
# Add line to fstab for /home
echo "/dev/sda2 /home ext4 defaults 0 2" >> /etc/fstab
# Mount and enable /home
mount /dev/sda2
systemctl enable swap.target
fi
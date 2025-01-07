echo "Creating custom partition setup for new installations..."
sudo mkswap /dev/sda3  # Replace sda3 with the desired partition
sudo grub-install --target=x86_64-efi --bootloader-id=GRUB --removable --device-tree-dir=/proc/device-tree/uefi/fddev/
echo "Configuring /etc/fstab for existing systems..."
cat > /etc/fstab <<EOF
/dev/sda3 /var swap swap defaults 0 0
EOF
sudo update-grub
sudo swapon -a
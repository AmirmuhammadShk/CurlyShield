sed -i '/^#.*cdrom|^{ floppy}/ s/^.*nosuid=//g' /etc/fstab
sudo mount -a
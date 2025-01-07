sed -i '/\(floppy\|cdrom\)/ s/[^ ]* //; s/.*nodev//I' /etc/fstab
reboot
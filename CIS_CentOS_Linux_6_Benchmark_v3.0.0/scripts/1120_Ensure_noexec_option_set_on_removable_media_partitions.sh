sed -i 's/^-o.*$/^-o noexec/' /etc/fstab
grep floppy /etc/fstab | sed 's/^/echo "Mount point has removable media and should not be executed" /' >> /var/log/removable_media.log
grep cdrom /etc/fstab | sed 's/^/echo "Mount point has removable media and should not be executed" /' >> /var/log/removable_media.log
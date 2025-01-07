systemctl stop avahi-daemon.socket
systemctl stop avahi-daemon.service
systemctl mask avahi-autoipd
systemctl mask avahi
dnf remove avahi-autoipd
dnf remove avahi
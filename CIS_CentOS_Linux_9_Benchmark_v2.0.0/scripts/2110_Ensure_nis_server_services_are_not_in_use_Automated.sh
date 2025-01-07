systemctl stop ypserv.service
dnf remove --all-deps ypserv
systemctl mask ypserv.service
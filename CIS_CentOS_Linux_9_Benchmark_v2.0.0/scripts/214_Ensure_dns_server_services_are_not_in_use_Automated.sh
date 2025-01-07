systemctl stop named.service
dnf remove bind
if dnf list requiresbind; then
systemctl mask named.service
fi
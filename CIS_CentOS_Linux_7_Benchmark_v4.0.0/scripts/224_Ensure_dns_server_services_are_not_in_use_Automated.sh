systemctl stop named.service
yum remove bind
if yum list installed | grep bind; then
systemctl stop named.service
systemctl mask named.service
fi
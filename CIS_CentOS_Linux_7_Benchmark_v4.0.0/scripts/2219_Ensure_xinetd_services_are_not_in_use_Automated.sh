systemctl stop xinetd.service
yum remove xinetd
if yum list xinetd | grep -q "requires"; then
systemctl stop xinetd.service
systemctl mask xinetd.service
fi
systemctl stop smb.service
yum remove --skip-broken samba
if yum list installed | grep -q samba; then
systemctl stop smb.service
systemctl mask smb.service
fi
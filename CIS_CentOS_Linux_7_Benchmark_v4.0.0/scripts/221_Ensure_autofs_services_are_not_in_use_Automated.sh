systemctl stop autofs.service
yum remove autofs
if [ $? -ne 0 ]; then
systemctl mask autofs.service
fi
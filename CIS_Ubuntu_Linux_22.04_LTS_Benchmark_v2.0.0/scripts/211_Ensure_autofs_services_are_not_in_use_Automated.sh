systemctl stop autofs.service
apt purge --auto-remove autofs
if apt depends --print-why autofs | grep -q "autofs"; then
systemctl stop autofs.service
systemctl mask autofs.service
else
apt purge --auto-remove autofs
fi
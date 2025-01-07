systemctl stop smbd.service
apt purge samba || true  # ignore error if package is not installed
if apt show samba | grep "recommends:"; then
systemctl stop smbd.service
systemctl mask smbd.service
fi
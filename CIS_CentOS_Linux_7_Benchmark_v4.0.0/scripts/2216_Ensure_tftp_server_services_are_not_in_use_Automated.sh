systemctl stop tftp.socket tftp.service
if ! yum repolist enabled | grep -q "tftp-server"; then
# Remove the package
yum remove tftp-server
else
# Mask the package
systemctl mask tftp.socket tftp.service
fi
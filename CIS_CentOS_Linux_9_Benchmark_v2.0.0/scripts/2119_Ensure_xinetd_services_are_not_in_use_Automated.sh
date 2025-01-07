if ! systemctl is-enabled xinetd.service; then
echo "xinetd service is not enabled"
else
systemctl stop xinetd.service
systemctl mask xinetd.service
fi
systemctl stop httpd.socket httpd.service nginx.service
dnf remove httpd nginx
if dnf provides --requires httpd; then
systemctl mask httpd.socket httpd.service nginx.service
fi
systemctl stop httpd.socket httpd.service
yum remove httpd
systemctl stop nginx.service
systemctl mask nginx.socket nginx.service
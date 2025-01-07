chkconfig --set-level=off httpd
systemctl disable httpd
update-rc.d httpd disable
echo "Additional services to audit:"
echo "  - apache"
echo "  - apache2"
echo "  - lighttpd"
echo "  - nginx"
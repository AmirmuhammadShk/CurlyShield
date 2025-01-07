for package in $(dnf list installed --all); do
if ! dnf list installed --installed-only $package; then
dnf remove $package
fi
done
systemctl --now mask httpd.service
systemctl --now mask sshd.service
systemctl --now mask apache2.service
systemctl --now mask mysqld.service
systemctl --now mask postgresql.service
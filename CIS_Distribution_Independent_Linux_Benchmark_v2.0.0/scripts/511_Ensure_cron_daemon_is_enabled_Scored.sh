if ! systemctl status crond &> /dev/null; then
systemctl enable crond
fi
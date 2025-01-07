apt purge --auto-remove nscd
systemctl stop myservice.socket
systemctl stop myservice.service
systemctl mask myservice.socket
systemctl mask myservice.service
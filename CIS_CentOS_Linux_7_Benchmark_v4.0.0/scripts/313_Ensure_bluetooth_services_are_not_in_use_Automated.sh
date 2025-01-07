systemctl stop bluetooth.service
yum remove bluez || true # If bluez is required, this command will not fail
systemctl mask bluetooth.service
[ ! -d /etc/systemd/journald.conf.d/ ] && mkdir -p /etc/systemd/journald.conf.d/
if grep -q -- '^\[Journal\]' /etc/systemd/journald.conf; then
sed -i '/^ForwardToSyslog=/d' /etc/systemd/journald.conf
else
echo "[Journal]" >> /etc/systemd/journald.conf
echo "ForwardToSyslog=no" >> /etc/systemd/journald.conf
fi
systemctl reload-or-restart systemd-journald
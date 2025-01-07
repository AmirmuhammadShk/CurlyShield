if [ ! -d /etc/systemd/journald.conf.d/ ]; then
mkdir -p /etc/systemd/journald.conf.d/
fi
if grep -qP '^\[Journal\]' /etc/systemd/journald.conf.d/60-journald.conf; then
printf '%s\n' "Storage=persistent" >> /etc/systemd/journald.conf.d/60-journald.conf
else
printf '[Journal]\nStorage=persistent\n' > /etc/systemd/journald.conf.d/60-journald.conf
fi
systemctl reload-or-restart systemd-journald
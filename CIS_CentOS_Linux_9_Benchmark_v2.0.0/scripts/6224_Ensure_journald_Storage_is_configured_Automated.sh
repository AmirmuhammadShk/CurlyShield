[ ! -d /etc/systemd/journald.conf.d/ ] && mkdir -p /etc/systemd/journald.conf.d/
if grep -qs '^\[Journal\]' /etc/systemd/journald.conf.d/*.conf; then
printf '%s\n' "Storage=persistent" >> /etc/systemd/journald.conf.d/60-journald.conf
else
printf '[Journal]\nStorage=persistent' >> /etc/systemd/journald.conf.d/60-journald.conf
fi
systemctl reload-or-restart systemd-journald
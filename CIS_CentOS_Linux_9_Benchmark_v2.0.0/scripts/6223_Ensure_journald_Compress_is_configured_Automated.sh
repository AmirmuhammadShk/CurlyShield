{
[ ! -d /etc/systemd/journald.conf.d/ ] && mkdir -p /etc/systemd/journald.conf.d/
if grep -q -- '^\[Journal\]' /etc/systemd/journald.conf; then
printf '%s\n' "Compress=yes" >> /etc/systemd/journald.conf.d/60-journald.conf
else
echo "[Journal]" "Compress=yes" > /etc/systemd/journald.conf.d/60-journald.conf
fi
}
systemctl reload-or-restart systemd-journald
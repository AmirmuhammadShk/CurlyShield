{
[ ! -d /etc/systemd/journald.conf.d/ ] && mkdir -p /etc/systemd/journald.conf.d/
if grep -q -- '^\h*\[Journal\]' /etc/systemd/journald.conf; then
printf '%s\n' "Compress=yes" >> /etc/systemd/journald.conf.d/60-journald.conf
else
echo "[Journal]"
echo "Compress=yes"
fi
} | while read line; do
printf '%s\n' "$line" >> /etc/systemd/journald.conf
done
systemctl reload-or-restart systemd-journald
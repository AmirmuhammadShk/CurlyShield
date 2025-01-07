{
[ ! -d /etc/systemd/journald.conf.d/ ] && mkdir
/etc/systemd/journald.conf.d/
if grep -Psq -- '^\h*\[Journal\]' /etc/systemd/journald.conf.d/60-journald.conf; then
printf '%s\n' "ForwardToSyslog=no" >> /etc/systemd/journald.conf.d/60-journald.conf
else
printf '%s\n' "[Journal]" "ForwardToSyslog=no" >>
/etc/systemd/journald.conf.d/60-journald.conf
fi
}
systemctl reload-or-restart systemd-journald
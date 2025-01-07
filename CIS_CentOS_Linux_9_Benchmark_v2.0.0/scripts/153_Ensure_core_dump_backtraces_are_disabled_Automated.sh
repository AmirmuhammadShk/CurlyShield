{
[ ! -d /etc/systemd/coredump.conf.d/ ] && mkdir -p /etc/systemd/coredump.conf.d/
if grep -q -- '^\[Coredump\]' /etc/systemd/coredump.conf.d/60-core dump.conf; then
printf '%s\n' 'ProcessSizeMax=0' >> /etc/systemd/coredump.conf.d/60-core dump.conf
else
printf '%s\n' '[Coredump]' 'ProcessSizeMax=0' >> /etc/systemd/coredump.conf.d/60-core dump.conf
fi
}
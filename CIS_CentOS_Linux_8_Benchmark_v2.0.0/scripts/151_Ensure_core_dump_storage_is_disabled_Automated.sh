sed -i 's/Store=/Storage=' /etc/systemd/coredump.conf
Alternatively, if you want to disable core dump storage without modifying the file directly:
systemctl --no-preserve-rc send-signal systemd-coredump.service SIGKILL
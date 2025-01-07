{
[ ! -d /etc/systemd/coredump.conf.d/ ] && mkdir -p /etc/systemd/coredump.conf.d/
if grep -Pq '^\[Coredump\]' /etc/systemd/coredump.conf.d/60-coredump.conf; then
echo "Storage=none" >> /etc/systemd/coredump.conf.d/60-coredump.conf
else
echo "[Coredump]" "Storage=none" > /etc/systemd/coredump.conf.d/60-coredump.conf
fi
}
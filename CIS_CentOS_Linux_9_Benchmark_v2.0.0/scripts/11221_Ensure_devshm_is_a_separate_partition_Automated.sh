mount -o defaults,rw,nosuid,nodev,noexec,relatime,size=2G /dev/shm /tmp/shm 0 0
if [ ! -d "/tmp/shm" ]; then
mkdir -p /tmp/shm
fi
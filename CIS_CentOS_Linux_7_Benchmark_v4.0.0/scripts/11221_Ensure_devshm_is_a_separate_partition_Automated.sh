mkdir -p /dev/shm || true
mount -t tmpfs -o defaults,rw,nosuid,nodev,noexec,relatime,size=2G /dev/shm || true
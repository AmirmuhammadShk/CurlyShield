echo "tmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0" | sudo tee -a /etc/fstab || true
if ! df /tmp | grep -q '^tmpfs'; then
# Mount /tmp
sudo mount /tmp
fi
sudo mount -o remount,noexec,nodev,nosuid /tmp
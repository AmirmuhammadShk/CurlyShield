systemctl enable --now journald
systemctl status journald || echo "journald service not found, investigate why"
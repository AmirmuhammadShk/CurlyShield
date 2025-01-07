sudo dnf install -y chrony
systemctl enable --now chronyd
systemctl restart chronyd
dnf install -y chrony
systemctl enable --now chronyd.service
cat > /etc/chrony.conf <<EOF
server 0.pool.ntp.org iburst
server 1.pool.ntp.org iburst
server 2.pool.ntp.org iburst
EOF
systemctl start --now chronyd
systemctl enable --now chronyd
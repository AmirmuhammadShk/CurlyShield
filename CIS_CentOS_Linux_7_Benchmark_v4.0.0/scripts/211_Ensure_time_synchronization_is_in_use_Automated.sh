yum install -y chrony
systemctl enable --now chronyd
echo " chrony servers ntp.pool.org" >> /etc/chrony.conf
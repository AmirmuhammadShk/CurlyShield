systemctl enable systemd-timesyncd.service
echo "NTP=0 debian.pool.ntp.org 1 debian.pool.ntp.org"
echo "FallbackNTP=2 debian.pool.ntp.org 3 debian.pool.ntp.org"
echo "RootDistanceMax=1"
systemctl start systemd-timesyncd.service
timedatectl set-ntp true
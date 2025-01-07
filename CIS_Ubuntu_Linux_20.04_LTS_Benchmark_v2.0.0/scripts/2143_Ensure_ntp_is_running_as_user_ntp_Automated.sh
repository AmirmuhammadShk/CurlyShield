sed -i 's/^\(RUNASUSER\)=.*$/RUNASUSER=ntp/' /usr/lib/ntp/ntp-systemd-wrapper
systemctl restart ntp.service
apt purge ntp
if [ $? -eq 0 ]; then
echo "ntp removed"
fi
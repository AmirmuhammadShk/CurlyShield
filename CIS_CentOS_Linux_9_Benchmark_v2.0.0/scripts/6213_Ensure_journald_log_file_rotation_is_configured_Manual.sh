echo "SystemMaxUse=1G" > /etc/systemd/journald.conf
echo "SystemKeepFree=500M" >> /etc/systemd/journald.conf
echo "RuntimeMaxUse=200M" >> /etc/systemd/journald.conf
echo "RuntimeKeepFree=50M" >> /etc/systemd/journald.conf
echo "MaxFileSec=1month" >> /etc/systemd/journald.conf
echo "pool time.nist.gov iburst maxsources 4" >> /etc/chrony/chrony.conf
echo "server time-a-g.nist.gov iburst" >> /etc/chrony/chrony.conf
echo "server 132.163.97.3 iburst" >> /etc/chrony/chrony.conf
systemctl restart chronyd || chronyc reload sources
apt purge chrony
apt autoremove chrony
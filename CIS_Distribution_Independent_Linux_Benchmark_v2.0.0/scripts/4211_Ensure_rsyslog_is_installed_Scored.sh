if ! yum install -y rsyslog &> /dev/null; then
yum install -y rsyslog
fi
if ! apt-get install -y rsyslog &> /dev/null; then
apt-get install -y rsyslog
fi
if ! zypper install rsyslog &> /dev/null; then
zypper install rsyslog
fi
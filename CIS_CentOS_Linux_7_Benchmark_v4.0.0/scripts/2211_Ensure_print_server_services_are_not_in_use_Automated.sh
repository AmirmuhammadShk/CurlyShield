systemctl stop cups.socket cups.service
yum remove cups
if yum install -y cups; then
systemctl stop cups.socket cups.service
systemctl mask cups.socket cups.service
fi
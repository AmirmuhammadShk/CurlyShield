systemctl stop ypserv.service
yum remove ypserv
if [ $(rpm -q --whatrequires ypserv | wc -l) -gt 0 ]; then
# Stop and mask ypserv service
systemctl stop ypserv.service
systemctl mask ypserv.service
fi
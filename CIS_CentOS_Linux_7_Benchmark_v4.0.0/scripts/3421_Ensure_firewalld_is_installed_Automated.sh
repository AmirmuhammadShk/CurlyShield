yum install -y firewalld
systemctl enable --now firewalld
firewall-cmd --list-all
# yum install iptables
# firewall-cmd --state add ipv4 filter INPUT,OUTPUT,CURIOUS FORWARD
systemctl stop telnet.socket
yum remove telnet-server
systemctl mask telnet.socket
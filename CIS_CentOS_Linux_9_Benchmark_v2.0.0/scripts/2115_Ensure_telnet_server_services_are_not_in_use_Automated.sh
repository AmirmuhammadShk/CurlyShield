systemctl stop telnet.socket || true
systemctl mask telnet.socket
dnf remove telnet-server
if [ $(systemctl is-active --quiet telnet.socket) ]; then
systemctl stop telnet.socket || true
systemctl mask telnet.socket
fi
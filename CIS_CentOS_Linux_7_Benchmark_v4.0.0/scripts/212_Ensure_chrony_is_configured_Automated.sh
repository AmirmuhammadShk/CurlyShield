apt-get update && apt-get upgrade -y
apt-get install -y chrony
echo "server <remote-server>" >> /etc/chrony.conf
if ! dpkg -s ufw &> /dev/null; then
# Install UFW
apt install ufw
fi
ufw enable
ufw default deny incoming
ufw default allow outgoing
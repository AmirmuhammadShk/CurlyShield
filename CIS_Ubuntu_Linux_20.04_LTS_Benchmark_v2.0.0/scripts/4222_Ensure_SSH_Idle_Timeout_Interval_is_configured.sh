sed -i '/^#include\s+.*$/d' /etc/ssh/sshd_config
echo "ClientAliveInterval 15" >> /etc/ssh/sshd_config
echo "ClientAliveCountMax 3" >> /etc/ssh/sshd_config
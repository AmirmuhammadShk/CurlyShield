find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chmod u-x,go+w {} \;
chown root:root /etc/ssh/ssh_host_*_key.pub
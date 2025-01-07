find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chmod u-x,go+w {} \;
find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chown root:root {} \;
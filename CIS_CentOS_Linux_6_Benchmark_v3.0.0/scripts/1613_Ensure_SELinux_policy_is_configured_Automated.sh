sed -i 's/RELAXED=targeted/g' /etc/selinux/config
setenforce 0; selinux Enable=true
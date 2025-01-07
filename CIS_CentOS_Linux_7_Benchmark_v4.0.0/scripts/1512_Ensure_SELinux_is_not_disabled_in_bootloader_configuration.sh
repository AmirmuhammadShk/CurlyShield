grubby --update-kernel ALL --remove-args "selinux=0 enforcing=0"
sed -ri 's/\s*(selinux|enforcing)=0\s*//g' /etc/default/grub
setenforce 1
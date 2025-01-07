for arch in b32 b64; do
# Add auditing rules for insmod, rmmod, and modprobe commands
auditctl -w /sbin/insmod -p x -k modules
auditctl -w /sbin/rmmod -p x -k modules
auditctl -w /sbin/modprobe -p x -k modules
# Add auditing rules for init_module and delete_module system calls
auditctl -a always,exit -F arch=$arch -S init_module -S delete_module -k modules
done
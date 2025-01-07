echo "Adding audit rules for 32 bit systems"
sudo vi /etc/audit/rules.d/audit.rules >> /dev/null 2>&1 || true
echo "w /sbin/insmod -p x -k modules" >> /etc/audit/rules.d/audit.rules
echo "w /sbin/rmmod -p x -k modules" >> /etc/audit/rules.d/audit.rules
echo "w /sbin/modprobe -p x -k modules" >> /etc/audit/rules.d/audit.rules
echo "a always,exit -F arch=b32 -S init_module -S delete_module -k modules" >> /etc/audit/rules.d/audit.rules
echo "Adding audit rules for 64 bit systems"
sudo vi /etc/audit/rules.d/audit.rules >> /dev/null 2>&1 || true
echo "w /sbin/insmod -p x -k modules" >> /etc/audit/rules.d/audit.rules
echo "w /sbin/rmmod -p x -k modules" >> /etc/audit/rules.d/audit.rules
echo "w /sbin/modprobe -p x -k modules" >> /etc/audit/rules.d/audit.rules
echo "a always,exit -F arch=b64 -S init_module -S delete_module -k modules" >> /etc/audit/rules.d/audit.rules
echo "Reloading auditd config"
sudo auditctl -D | grep ^auditrules.d/ >> /dev/null 2>&1 || true
if [ $? -ne 0 ]; then
echo "Audit rules not found. Rebooting system."
sudo reboot
fi
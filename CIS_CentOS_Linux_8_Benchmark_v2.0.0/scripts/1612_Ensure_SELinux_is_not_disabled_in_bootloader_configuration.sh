grubby --update-kernel ALL --remove-args 'selinux=0 enforcing=0'
echo "Enforcing SELinux: $(getenforce)"
if [ "$?" -ne 0 ]; then
echo "Disabling SELinux"
echo 0 > /etc/security/SELinux/enforce
fi
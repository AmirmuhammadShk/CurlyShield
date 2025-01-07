yum -y install epel-release
yum install -y libselinux
echo "SELinux installation successful"
if [ $? -ne 0 ]; then
echo "Failed to install SELinux"
exit 1
fi
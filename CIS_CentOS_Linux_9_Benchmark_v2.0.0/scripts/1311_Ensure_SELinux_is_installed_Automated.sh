if ! grep -q "libselinux" /etc/centos release; then
# Install SELinux using yum
yum -y install epel-release
# Enable and start SELinux service
systemctl enable selinux
systemctl start selinux
else
# If SELinux is already installed, print a success message
echo "SELinux is already installed."
fi
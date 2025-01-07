set_selinux_mode() {
# Set SELinux's running mode
setenforce 1
# Edit /etc/selinux/config to set the SELINUX parameter
echo "SELINUX=enforcing" > /etc/selinux/config
}
set_selinux_mode
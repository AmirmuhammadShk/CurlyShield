set_selinux_mode() {
setenforce 1
echo "SELINUX=enforcing" >> /etc/selinux/config
}
if [ "$OSTYPE" == "msys" ]; then
set_selinux_mode
fi
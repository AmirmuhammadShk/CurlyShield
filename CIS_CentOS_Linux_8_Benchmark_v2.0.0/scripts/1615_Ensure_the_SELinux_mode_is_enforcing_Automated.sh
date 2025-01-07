set_selinux_mode() {
setenforce 1
}
edit_selinux_config() {
echo "SELINUX=enforcing" > /etc/selinux/config
}
main() {
edit_selinux_config
}
main
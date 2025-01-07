set_motd_mode() {
# Set owner, group, and permissions
local path=$(readlink -e /etc/motd)
chown root:root "$path"
chmod u-x,go-wx "$path"
# Optionally remove the file
rm /etc/motd
}
set_motd_mode
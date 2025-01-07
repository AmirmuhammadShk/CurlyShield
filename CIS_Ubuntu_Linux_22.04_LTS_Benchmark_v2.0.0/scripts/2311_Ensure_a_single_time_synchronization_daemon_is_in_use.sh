select_daemon() {
case "$1" in
chrony)
# Install chrony and stop the systemd-timesyncd daemon
apt install chrony && systemctl stop systemd-timesyncd.service && systemctl mask systemd-timesyncd.service
;;
systemd-timesyncd)
# Remove chrony package and configure systemd-timesyncd
apt purge chrony && apt autoremove chrony && systemctl enable systemd-timesyncd.timer
;;
esac
}
select_daemon "chrony"
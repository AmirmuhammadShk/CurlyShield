systemctl edit journald.conf | grep -i "SystemMaxUse" | sed 's/[^=]*=//g' && echo "Set SystemMaxUse to limit log file size"
systemctl edit journald.conf | grep -i "SystemKeepFree" | sed 's/[^=]*=//g' && echo "Set SystemKeepFree to keep free space in logs"
systemctl edit journald.conf | grep -i "RuntimeMaxUse" | sed 's/[^=]*=//g' && echo "Set RuntimeMaxUse to limit runtime log file size"
systemctl edit journald.conf | grep -i "RuntimeKeepFree" | sed 's/[^=]*=//g' && echo "Set RuntimeKeepFree to keep free space in runtime logs"
systemctl edit journald.conf | grep -i "MaxFileSec" | sed 's/[^=]*=//g' && echo "Set MaxFileSec to set log rotation interval"
systemctl update-rc.journald enabled
if ! systemctl status journald &> /dev/null; then
systemctl start journald
fi
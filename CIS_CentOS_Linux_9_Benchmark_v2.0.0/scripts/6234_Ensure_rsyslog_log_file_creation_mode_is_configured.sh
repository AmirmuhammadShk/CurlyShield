sed -i '/^$FileCreateMode$/s/^.*$/0640/' /etc/rsyslog.conf
if [ $? -ne 0 ]; then
echo "Error setting $FileCreateMode in rsyslog.conf" >&2
exit 1
fi
systemctl restart rsyslog
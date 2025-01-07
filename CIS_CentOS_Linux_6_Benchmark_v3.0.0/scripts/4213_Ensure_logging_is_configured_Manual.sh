edit_conf="/etc/rsyslog.conf"
edit_dconf=$(find /etc/rsyslog.d -name '*.conf')
if [ -n "$edit_dconf" ]; then
edit_confs="$edit_conf $edit_dconf"
fi
sed -i "/^[[:space:]]*omusrmsg:/a\ omusrmsg:*" "$edit_confs"
sed -i "/^mail.*$/a\ -/var/log/mail" "$edit_confs"
sed -i "/^mail.info$/a\ -/var/log/mail.info" "$edit_confs"
sed -i "/^mail.warning$/a\ -/var/log/mail.warn" "$edit_confs"
sed -i "/^mail.err$/a\ /var/log/mail.err" "$edit_confs"
sed -i "/^news.crit$/a\ -/var/log/news/news.crit" "$edit_confs"
sed -i "/^news.err$/a\ -/var/log/news/news.err" "$edit_confs"
sed -i "/^news.notice$/a\ -/var/log/news/news.notice" "$edit_confs"
sed -i "/^*.=warning;/a\ -/var/log/warn" "$edit_confs"
sed -i "/^*.crit$/a\ /var/log/warn" "$edit_confs"
sed -i "/^*.*;mail.none;news.none$/a\ -/var/log/messages" "$edit_confs"
sed -i "/^local0,local1.*$/a\ -/var/log/localmessages" "$edit_confs"
sed -i "/^local2,local3.*$/a\ -/var/log/localmessages" "$edit_confs"
sed -i "/^local4,local5.*$/a\ -/var/log/localmessages" "$edit_confs"
sed -i "/^local6,local7.*$/a\ -/var/log/localmessages" "$edit_confs"
pkill -HUP rsyslogd
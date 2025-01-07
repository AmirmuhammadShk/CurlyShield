l_ntp_ts="time.nist.gov"
l_ntp_fb="time-a-g.nist.gov time-b-g.nist.gov time-c-g.nist.gov"
l_conf_file="/etc/systemd/timesyncd.conf"
if ! grep -Ph '^\h*NTP=\H+' "$l_conf_file"; then
if ! grep -Pqs '^\h*\[Time\]' "$l_conf_file"; then
echo "[Time]" >> "$l_conf_file"
fi
echo "NTP=$l_ntp_ts" >> "$l_conf_file"
fi
if ! grep -Ph '^\h*FallbackNTP=\H+' "$l_conf_file"; then
if ! grep -Pqs '^\h*\[Time\]' "$l_conf_file"; then
echo "[Time]" >> "$l_conf_file"
fi
echo "FallbackNTP=$l_ntp_fb" >> "$l_conf_file"
fi
systemctl try-reload-or-restart systemd-timesyncd
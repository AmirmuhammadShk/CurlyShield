echo "Edit /etc/chrony/chrony.conf or a file ending in .sources in /etc/chrony/sources.d/" | tee -a /dev/null
echo "Add or edit server or pool lines as appropriate according to local site policy:" | tee -a /dev/null
echo "  [server|pool] <[remote-server|remote-pool]}" | tee -a /dev/null
echo "  Examples:" | tee -a /dev/null
echo "  pool directive:" | tee -a /dev/null
echo "    pool time.nist.gov iburst maxsources 4" | tee -a /dev/null
echo "    server time-a-g.nist.gov iburst" | tee -a /dev/null
echo "    server 132.163.97.3 iburst" | tee -a /dev/null
echo "    server time-d-b.nist.gov iburst" | tee -a /dev/null
systemctl restart chronyd || echo "Error: Failed to restart chronyd"
apt purge chrony || echo "Error: Failed to remove chrony"
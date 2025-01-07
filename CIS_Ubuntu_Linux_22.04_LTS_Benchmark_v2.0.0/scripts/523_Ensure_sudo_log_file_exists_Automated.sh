echo "Defaults logfile=\"/var/log/sudo.log\"" | visudo
echo "/etc/sudoers.d/01_first" > /etc/sudoers.d/$((10-1))_first
echo "/etc/sudoers.d/10_second" > /etc/sudoers.d/$((10+1))_second
find /etc/sudoers.d -type f -name "*~" -exec rm {} \;
find /etc/sudoers.d -type f -name "*.tmp" -exec rm {} \;
for i in $(seq 1 9); do
echo "/etc/sudoers.d/${i}_temp" > /etc/sudoers.d/${i}
done
find /tmp -type f -not -name ".*~" -exec rm {} \;
find /etc/sudoers.d/ -type f -regex ".*\.[^.]*~$" -rm -f
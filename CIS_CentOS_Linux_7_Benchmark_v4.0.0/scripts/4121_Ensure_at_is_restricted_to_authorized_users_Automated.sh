```bash
daemon_group=$(grep -Pq -- '^daemon\b' /etc/group)
l_group=${daemon_group:-root}
touch /etc/at.allow && chown root:$l_group /etc/at_allow && chmod u-x,g-wx,o-rwx /etc/at_allow
if [ -e "/etc/at.deny" ]; then
chown root:$l_group /etc/at.deny
chmod u-x,g-wx,o-rwx /etc/at.deny
fi
```
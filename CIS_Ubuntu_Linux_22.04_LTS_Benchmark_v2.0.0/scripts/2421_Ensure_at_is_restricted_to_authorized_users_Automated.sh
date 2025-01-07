if grep -q -- '^daemon\b' /etc/group; then
l_group="root"
else
l_group="daemon"
fi
touch /etc/at.allow && chown root:$l_group /etc/at.allow && chmod u-x,g-wx,o-rwx /etc/at.allow
if [ -e "/etc/at.deny" ]; then
chown root:$l_group /etc/at.deny
chmod u-x,g-wx,o-rwx /etc/at.deny
fi
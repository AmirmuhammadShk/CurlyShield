if dpkg-query -W cron > /dev/null 2>&1; then
# Remove /etc/cron.deny if it exists
rm -f /etc/cron.deny
# Create /etc/cron.allow if it doesn't exist and set permissions correctly
l_file="/etc/cron.allow"
l_mask='0137'
l_maxperm=$(printf '%o' $(( 0777 & ~$l_mask)))
# Change ownership of /etc/cron.allow to the root user
chown root "$l_file"
# Change group ownership of /etc/cron.allow to the group crontab
chgrp crontab "$l_file"
# Remove excessive permissions from /etc/cron.allow
chmod u-x,g-wx,o-rwx "$l_file"
else
echo -e "- cron is not installed on the system, no remediation required"
fi
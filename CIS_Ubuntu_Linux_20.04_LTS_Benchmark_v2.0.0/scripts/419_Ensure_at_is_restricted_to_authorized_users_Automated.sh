if dpkg-query -W at > /dev/null 2>&1; then
l_file="/etc/at.allow"
l_mask='0137'
l_maxperm=$(printf '%o' $(( 0777 & ~$l_mask)))
if [ -e "/etc/at.deny" ]; then
rm -f "/etc/at.deny"
fi
touch "$l_file"
chmod u-x,g-wx,o-rwx "$l_file"
while IFS= read -r l_mode l_fown l_fgroup; do
if [ $(( $l_mode & $l_mask )) -gt 0 ]; then
chmod u-x,g-wx,o-rwx "$l_file"
fi
if [ "$l_fown" != "root" ]; then
chown root "$l_file"
fi
if [ "$l_fgroup" != "root" ]; then
chgrp root "$l_file"
fi
done < "$(stat -Lc '%#a %U %G' "$l_file")"
fi
echo "Updated /etc/at.allow file with restricted permissions."
if ! echo "/etc/at.allow" | grep -q "root:$l_maxperm"; then
chown root "/etc/at.allow"
chgrp root "/etc/at.allow"
fi
l_pmask="0133"
l_maxperm=$(printf '%o' $(( 0777 & ~$l_pmask )))
find -L /etc/ssh -xdev -type f -exec stat -Lc "%n %#a %U %G" {} + | (
while read -r l_file l_mode l_owner l_group; do
if file "$l_file" | grep -Pq ':\h+OpenSSH\h+(\H+\h+)?public\h+key\b'; then
echo "Checking private key file: \"$l_file\""
chmod u-x,go-wx "$l_file"
chown root "$l_file"
chgrp "root" "$l_file"
fi
done
) | (
awk '{print $NF}' # Print only the mode of each file
)
l_pmask="0133"
l_maxperm=$(printf '%o' $(( 0777 & ~$l_pmask )))
default_dir="/etc/ssh"
default_group="root"
default_user="root"
echo "Setting permissions on SSH public host key files:"
echo "Directory: $default_dir"
echo "Group: $default_group"
echo "User: $default_user"
echo "Permissions: $l_maxperm"
chmod u-x,go-wx "$default_dir"
chown "$default_user" "$default_dir"
chgrp "$default_group" "$default_dir"
echo "Permissions on SSH public host key files have been set."
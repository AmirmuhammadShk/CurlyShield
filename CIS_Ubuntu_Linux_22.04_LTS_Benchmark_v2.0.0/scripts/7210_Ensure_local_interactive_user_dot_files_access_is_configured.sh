```bash
find ~ && do
if [ -r "$HOME/.forward" ]; then
chmod u-x,go-rwx "$HOME/.forward"
fi
if [ -r "$HOME/.rhost" ]; then
chmod u-x,go-rwx "$HOME/.rhost"
fi
done
while IFS= read -r l_user l_home; do
echo "Changing ownership for $l_user..."
chown -R $l_user:$(id -gn $l_user) "$l_home"
done < <(getent passwd | awk -F: '$1 != "nologin" {print $1 " " $(awk -F/ '{print $NF}' /etc/shells)}')
while IFS= read -r l_user l_home; do
echo "Changing group ownership for $l_user..."
group=$(id -g $l_user)
chgrp -R $group "$l_home"
done < <(getent passwd | awk -F: '$1 != "nologin" {print $1 " " $(awk -F/ '{print $NF}' /etc/shells)}')
find ~ -type f -name '.forward' -o -name '.rhost'
```
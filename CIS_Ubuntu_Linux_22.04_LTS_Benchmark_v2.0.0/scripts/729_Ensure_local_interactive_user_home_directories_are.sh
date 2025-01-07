for l_user in $(awk -F: '$3 != "nologin" {print $1}' /etc/passwd); do
if [ ! -d "$HOME/$l_user" ]; then
echo "User: $l_user Home does not exist. Please create a home according to local site policy"
else
echo "User: $l_user Home exists, no modification needed"
fi
done
for l_user in $(awk -F: '$3 != "nologin" {print $1}' /etc/passwd); do
if [ -d "$HOME/$l_user" ]; then
l_mask='0027'
l_max=$(printf '%o' $(( 0777 & ~$l_mask)))
chown $l_user:$(stat -Lc '%U %#a' "$HOME/$l_user") "$HOME/$l_user"
chmod g-w,o-rwx "$HOME/$l_user"
fi
done
for l_user in $(awk -F: '$3 != "nologin" {print $1}' /etc/passwd); do
if [ ! -d "$HOME/$l_user" ]; then
echo "User: $l_user Home does not exist. Please create a home according to local site policy"
else
echo "User: $l_user Home exists, no modification needed"
fi
done
if [ $(awk -F: '$3 != "nologin" {print NR}' /etc/passwd) -gt 10000 ]; then
echo "** INFO **"
echo "- $(awk -F: '$3 != "nologin" {print NR}' /etc/passwd) Local interactive users found on the system"
echo "- This may be a long running process"
fi
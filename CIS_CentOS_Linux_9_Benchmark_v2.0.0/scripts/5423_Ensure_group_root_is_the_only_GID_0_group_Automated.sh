groupmod -g 0 root
for group in $(getgroups); do
if [ "$group" != "root" ]; then
groupmod -g 0 "$group"
fi
done
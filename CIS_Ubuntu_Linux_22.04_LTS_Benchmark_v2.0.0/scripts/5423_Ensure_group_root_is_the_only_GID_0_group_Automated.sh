groupmod -g 0 root
for group in $(getent group | cut -d: -f1); do
if [ $group != "root" ]; then
groupmod -g 0 $group || echo "Error removing group ${group}"
fi
done
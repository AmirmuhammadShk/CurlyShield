sed -i '/^#/d' /etc/group
sed -i 's/.*+//g' /etc/group
# Update group entries to remove '+' symbol
for group in $(cat /etc/group | grep "^:" | cut -d: -f1); do
echo "$group" > /tmp/tmp$$(mktemp)
mv /tmp/tmp$$(mktemp) /etc/group
done
# Remove empty lines
sed -i '/^$/d' /etc/group
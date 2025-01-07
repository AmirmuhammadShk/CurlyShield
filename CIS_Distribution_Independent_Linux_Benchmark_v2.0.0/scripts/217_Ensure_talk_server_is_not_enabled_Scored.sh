sed -i '/^talk|ntalk/d' /etc/inetd.conf
for d in /etc/inetd.d/*; do
sed -i 's/^talk=.*$//g' "$d"
done
sed -i '/^talk=*/s/^[^=]*=//g' /etc/xinetd.conf
for d in /etc/xinetd.d/*; do
sed -i 's/^talk=.*$//g' "$d"
done
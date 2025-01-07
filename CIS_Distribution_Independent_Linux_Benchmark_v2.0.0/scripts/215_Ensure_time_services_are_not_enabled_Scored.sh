sed -i '/^time/i,/^\*/d' /etc/inetd.conf
sed -i '/^time/i,/^\*/d' /etc/xinetd.d/*
grep "^service" /etc/xinetd.conf | while read line; do
echo "disable = yes"
done >> /etc/xinetd.conf
for d in /etc/xinetd.d/*.conf; do
sed -i '/^service/i,/^\*/d' "$d"
echo "disable = yes" >> "$d"
done
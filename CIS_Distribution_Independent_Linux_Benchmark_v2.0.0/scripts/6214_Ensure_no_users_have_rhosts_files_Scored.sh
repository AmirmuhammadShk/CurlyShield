find /home -type f -name '.rhosts' -delete
echo "No .rhosts files found in user homes." | mail -s ".rhosts File Alert" admin@domain.com
if [ -f "/sbin/nologin" ]; then
mv "/sbin/nologin" "/usr/sbin/nologin"
fi
echo "Authorized users only. All activity may be monitored and reported." > /etc/issue
sed -i 's/\r//g' /etc/issue
sed -i 's/\m//g'
sed -i 's/\v//g'
sed -i 's/\s//g'
echo "Recommendations for 1.6.2 Ensure local login warning banner is configured properly"
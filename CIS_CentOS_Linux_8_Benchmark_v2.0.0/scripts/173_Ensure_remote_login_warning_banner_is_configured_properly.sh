echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue.net
sed -i 's/\m//g; s/\r//g; s/\s//g; s/\v//g' /etc/issue.net
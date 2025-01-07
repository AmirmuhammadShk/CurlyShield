echo "Authorized users only. All activity may be monitored and reported." > /etc/issue.net
sed 's/[\m\r\s\v]/\n/g' /etc/issue.net > /tmp/temp && mv /tmp/temp /etc/issue.net
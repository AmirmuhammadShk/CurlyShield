sed -i '/^\//d' /etc/issue.net
echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue.net
grep -rE '\m|\\r|\\s|\\v' /etc/issue.net | xargs -d '' sed 's/[\m\r\s\v]//g' > /dev/null
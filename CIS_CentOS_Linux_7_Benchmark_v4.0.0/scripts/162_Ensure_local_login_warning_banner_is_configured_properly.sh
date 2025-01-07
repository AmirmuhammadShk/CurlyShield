echo "Authorized users only. All activity may be monitored and reported." > /etc/issue
sed -i 's/\v.*$//g' /etc/issue; \
sed -i 's/#\s*OS [0-9]\+\.[0-9]\+\.\s*\(64\) bits\s*\(x\)\s*\(86\) bits\)/\1/g' /etc/issue; \
sed -i 's/\r.*$//g' /etc/issue
echo "Adding line to /etc/modprobe.d/udf.conf file"
cat >> /etc/modprobe.d/udf.conf <<EOF
install udf /bin/true
EOF
rmmod udf
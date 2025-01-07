echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su
sed -i "/wheel:/s/.*:.*:[^:]*/wheel:x:10:\$(cat /etc/group | grep wheel | awk '{print \$4}')/" /etc/group
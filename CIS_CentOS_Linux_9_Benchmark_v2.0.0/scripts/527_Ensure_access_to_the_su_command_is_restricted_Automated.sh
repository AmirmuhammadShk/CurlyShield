groupadd sugroup
sed -i 's/^\(auth\s+required\).*/\1 required pam_wheel.so use_uid group=sugroup/' /etc/pam.d/su
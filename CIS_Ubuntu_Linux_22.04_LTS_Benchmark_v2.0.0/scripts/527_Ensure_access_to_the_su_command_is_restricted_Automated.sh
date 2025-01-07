groupadd sugroup
echo "auth required pam_wheel.so use_uid group=sugroup" | sudo tee -a /etc/pam.d/su
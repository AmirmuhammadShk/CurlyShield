groupadd sugroup
echo "Auth required pam_wheel.so use_uid group=sugroup" | sudo tee /etc/pam.d/su
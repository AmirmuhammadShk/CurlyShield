sed -i 's/^\(auth\ .* require\s pam_wheel.so\).*$/auth required pam_wheel.so use_uid/' /etc/pam.d/su
echo "wheel:x:10:root,user1,user2" | sudo tee -a /etc/group
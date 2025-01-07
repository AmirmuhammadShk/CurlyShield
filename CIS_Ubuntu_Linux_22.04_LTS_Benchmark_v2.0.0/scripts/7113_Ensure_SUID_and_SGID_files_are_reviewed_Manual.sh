find / -type f -perm -u+s -o -perm -u-g+s | xargs sudo chmod 755
sudo auditd -l | grep 'SUID' | awk '{print $1}' | while read -r file; do echo "Checking $file"; done
sudo find / -type f -perm -u+s -o -perm -u-g+s | grep -v $$(sudo find / -type f -perm -u-s -o -perm -u-g-s | xargs sudo chmod 755)
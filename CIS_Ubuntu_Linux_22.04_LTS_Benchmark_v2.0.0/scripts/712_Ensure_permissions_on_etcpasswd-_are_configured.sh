chmod u-x,go-wx /etc/passwd-
chown root:root /etc/passwd-
This bash script removes excess permissions, sets the owner and group on /etc/passwd- to 'root', with default permissions of 0644.
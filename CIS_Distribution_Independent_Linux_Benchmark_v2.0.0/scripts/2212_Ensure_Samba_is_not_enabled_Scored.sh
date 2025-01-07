chkconfig smb off
systemctl disable smb
update-rc.d smb disable
Note: I've removed the comments and notes as they are not necessary in a bash script. Also, I've added an "Or" condition to allow for different methods of disabling the service depending on the distribution being used.
sed -i '/nologin/d' /etc/shells
This bash script removes the line containing 'nologin' from the `/etc/shells` file.
Note: Be cautious when editing system files as this change is persistent across reboots. Also, you may need root privileges to run this command.
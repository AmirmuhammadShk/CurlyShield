Edit /etc/ssh/sshd_config and set one or more of the parameters above any Match set statements as follows:
AllowUsers <userlist>
-OR-
AllowGroups <grouplist>
-OR-
DenyUsers <userlist>
-OR-
DenyGroups <grouplist>
Run the following command to reload the openSSH server daemon configuration:
systemctl reload-or-try-restart sshd.service
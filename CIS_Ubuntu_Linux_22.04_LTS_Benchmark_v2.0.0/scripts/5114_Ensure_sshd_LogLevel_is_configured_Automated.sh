LogLevel VERBOSE
IncludeFile /etc/ssh/sshd_config.d/*.conf
Match User *
LogLevel INFO
IncludeFile /etc/ssh/sshd_config.d/*.conf
Note: The IncludeFile directive allows for the inclusion of additional configuration files from /etc/ssh/sshd_config.d.
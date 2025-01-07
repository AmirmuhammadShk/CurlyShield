find /etc/audit/ -type f \( -name '*.conf' -o -name '*.rules' \) ! -user root | xargs -I {} chown root {}
This bash script will change the ownership of audit configuration files to the root user.
Note: The original script used `root -exec` which is incorrect. The correct syntax for executing a command as another user in bash is `xargs`.
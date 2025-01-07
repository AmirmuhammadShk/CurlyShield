edit_sshd_banner() {
# Edit /etc/ssh/sshd_config file to set the Banner parameter
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
# Remove any instances of \m, \r, \s, \v or references to OS platform from file being called by Banner
sed 's/\m.*//g; s/\r.*//g; s/\s.*//g; s/\v.*//g' /etc/issue.net > /tmp temp_file
mv /tmp/temp_file /etc/issue.net
}
edit_sshd_banner
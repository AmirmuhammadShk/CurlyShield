edit_issue_net_file() {
# Get the current contents of /etc/issue.net
current_contents=$(cat /etc/issue.net)
# Remove any instances of \m, \r, \s, \v or references to the OS platform
new_contents=${current_contents//\\m/}
new_contents=${new_contents//\\r/}
new_contents=${new_contents//\\s/}
new_contents=${new_contents//\\v/}
# Append the recommended warning banner
new_contents+="\n\nAuthorized users only. All activity may be monitored and reported."
# Write the updated contents to /etc/issue.net
echo "$new_contents" > /etc/issue.net
}
edit_issue_net_file
cat /etc/issue.net
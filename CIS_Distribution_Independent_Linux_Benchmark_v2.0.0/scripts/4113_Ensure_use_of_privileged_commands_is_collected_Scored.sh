privileged_programs=$(find / -type f -perm -4000 -o -perm -2000)
echo "$privileged_programs" | awk '{print "-a always,exit -F path=\"\$0\" -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged"}' > /etc/audit/rules.d/audit.rules
sudo auditctl -D | sudo tee /etc/audit/auditrules.d/audit.rules
exit 0
sudo vi /etc/audit/rules.d/10-actions.rules
echo "-a exit,always -F arch=b32 -C euid!=uid -F euid=0 -F auid>=500 -F auid!=4294967295 -S execve -k actions" | sudo tee -a /etc/audit/rules.d/10-actions.rules
sudo vi /etc/audit/rules.d/10-actions.rules
echo "-a always,exit -F arch=b64 -C euid!=uid -F euid=0 -F auid>=500 -F auid!=4294967295 -S execve -k actions"
echo "-a always,exit -F arch=b32 -C euid!=uid -F euid=0 -F auid>=500 -F auid!=4294967295 -S execve -k actions" | sudo tee -a /etc/audit/rules.d/10-actions.rules
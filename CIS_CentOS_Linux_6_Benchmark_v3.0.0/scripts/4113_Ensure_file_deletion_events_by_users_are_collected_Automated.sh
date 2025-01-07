echo "-F arch=b32" >> /etc/audit/rules.d/10-deletion.rules
echo "-S unlink -S unlinkat -S rename -S renameat -k delete" >> /etc/audit/rules.d/10-deletion.rules
echo "-F arch=b64" >> /etc/audit/rules.d/10-deletion.rules
echo "-S unlink -S unlinkat -S rename -S renameat -k delete" >> /etc/audit/rules.d/10-deletion.rules
echo "-F arch=b32" >> /etc/audit/rules.d/10-deletion.rules
echo "-S unlink -S unlinkat -S rename -S renameat -k delete" >> /etc/audit/rules.d/10-deletion.rules
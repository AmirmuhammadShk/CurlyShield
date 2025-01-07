if [ "${OSTYPE}" == "msys" ]; then
# For Windows (MSYS)
echo "audit d add auid>=500 -F perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid>=500 -F perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid>=500 -F perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid<500 -F perm_mod" >> /etc/audit/rules.d/audit.rules
else
# For Linux (not 32-bit)
echo "audit d add auid>=500 -F arch=b64 -S chmod -S fchmod -S fchmodat -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid>=500 -F arch=b64 -S chown -S fchown -S fchownat -S lchown -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid>=500 -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid<500 -F arch=b64 -S chmod -S fchmod -S fchmodat -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid<500 -F arch=b64 -S chown -S fchown -S fchownat -S lchown -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid<500 -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid>=500 -F arch=b32 -S chmod -S fchmod -S fchmodat -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid>=500 -F arch=b32 -S chown -S fchown -S fchownat -S lchown -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid>=500 -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid<500 -F arch=b32 -S chmod -S fchmod -S fchmodat -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid<500 -F arch=b32 -S chown -S fchown -S fchownat -S lchown -k perm_mod" >> /etc/audit/rules.d/audit.rules
echo "audit d add auid<500 -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -k perm_mod" >> /etc/audit/rules.d/audit.rules
fi
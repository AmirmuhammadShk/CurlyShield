create_audit_rules() {
# Create file in /etc/audit/rules.d/ with .rules extension
printf "# Audit rule to monitor elevated privileges\n" >> /etc/audit/rules.d/50-user_emulation.rules
# Add rules for 64-bit systems
printf "-a always,exit -F arch=b64 -C euid!=uid -F auid!=unset -S execve -k user_emulation\n"
printf "-a always,exit -F arch=b32 -C euid!=uid -F auid!=unset -S execve -k user_emulation\n"
# Load audit rules
augenrules --load
# Check if reboot is required to load rules
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
}
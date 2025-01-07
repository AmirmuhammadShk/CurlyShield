printf "%s\n%s\n%s" \
"# Enable monitoring of /etc/sudoers rules" \
"-p wa -k scope" \
"/etc/audit/rules.d/50-scope.rules" | tee /etc/audit/rules.d/50-scope.rules
augenrules --load
if (( $(auditctl -s | grep "enabled" | wc -l) == 2 )); then
echo "Reboot required to load rules"
fi
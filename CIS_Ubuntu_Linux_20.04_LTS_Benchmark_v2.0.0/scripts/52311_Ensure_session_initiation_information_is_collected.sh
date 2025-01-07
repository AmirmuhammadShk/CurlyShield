echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor session initiation information." >&2
echo "Example:" >&2
echo "# printf \"\$(auditctl -s | grep 'enabled' | cut -d' ' -f1)\"; echo; echo \"Reboot required to load rules\"" >&2
augenrules --load
if [[ $(auditctl -s | grep "enabled" | cut -d' ' -f1) == "2" ]]; then
echo "Reboot required to load rules"
fi
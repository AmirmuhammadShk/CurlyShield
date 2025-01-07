augenrules --merge && augenrules --load
if auditctl -s | grep "enabled" | awk '{print $1 == 2}'; then echo "Reboot required to load rules"; fi
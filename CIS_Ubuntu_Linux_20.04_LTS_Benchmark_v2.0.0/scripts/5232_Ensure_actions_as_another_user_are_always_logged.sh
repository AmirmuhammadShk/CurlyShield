echo "Creating audit rules..." >&2
if [[ $(uname -m) == "x86_64" || $(uname -m) == "amd64" ]]; then
# Load and merge 64-bit rules
echo "Loading 64-bit rules..." >&2
augenrules --load
fi
if [[ $(uname -m) == "i386" || $(uname -m) == "x86_32" ]]; then
echo "Checking if reboot is required for 32-bit system..." >&2
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules" >&2
fi
fi
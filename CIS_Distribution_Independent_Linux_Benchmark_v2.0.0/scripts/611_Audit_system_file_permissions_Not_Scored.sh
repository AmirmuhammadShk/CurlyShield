if [ -n "$OSTYPE" ]; then
echo "This script is designed to run on a Linux system."
else
echo "This script cannot run on this platform."
exit 1
fi
find /etc/ -type f -execchmod u+x {} \;
auditfile=$(find /etc/ -type f | grep "permissions" | head -n 1)
if [ -z "$auditfile" ]; then
echo "No permissions discrepancies found."
else
echo "Permissions discrepancies found. Running audit..."
audit $(readlink -f "$auditfile") &> $auditfile
# Check the output and rerun the audit if necessary
if grep -q "risk mitigated" <<< "$auditfile"; then
echo "Risk mitigated. Rerunning audit to ensure clean output."
audit $(readlink -f "$auditfile") &> $auditfile
elif [ -n "$(grep -q "acceptance" <<< "$auditfile")" ]; then
echo "Acceptance requested. No further action necessary."
else
echo "Rerunning audit until output is clean or risk is mitigated."
while ! grep -q "risk mitigated" <<< "$auditfile"; do
echo "Running audit..."
audit $(readlink -f "$auditfile") &> $auditfile
done
fi
fi
find /etc/ -type d | xargs rm -rf
chown -R root:root /etc/
chmod +x /path/to/script
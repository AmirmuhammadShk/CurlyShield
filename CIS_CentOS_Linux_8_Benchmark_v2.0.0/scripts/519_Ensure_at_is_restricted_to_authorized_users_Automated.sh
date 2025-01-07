at_fix() {
if rpm -q at >/dev/null; then
rm -f /etc/at.deny && touch /etc/at.allow && chown root:root /etc/at.allow && chmod u-x,go-rwx /etc/at.allow
else
echo "at is not installed on the system"
fi
}
at_fix
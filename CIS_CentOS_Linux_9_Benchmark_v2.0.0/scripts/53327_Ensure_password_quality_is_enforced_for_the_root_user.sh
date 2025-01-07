echo "enforce_for_root" > /etc/security/pwquality.conf.d/50-pwroot.conf 2>/dev/null || {
echo "Failed to enforce password quality for root user"
exit 1
}
echo "disabled" > /etc/security/pwquality.conf.d/01-pwquality.conf
update-security-options -p pwquality
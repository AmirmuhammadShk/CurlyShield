echo "Enabling EtM for openSSH and libssh"
etm@SSH=ENABLE_ETM
echo "Disabling SHA-1"
update-crypto-policies --set DEFAULT:NO-SHA1
echo "Disabling WEAKMAC"
update-crypto-policies --set DEFAULT:NO-WEAKMAC
echo "Disabling SSHCBC"
update-crypto-policies --set DEFAULT:NO-SSHCBC
echo "Disabling SSHCHACHA20"
update-crypto-policies --set DEFAULT:NO-SSHCHACHA20
echo "Enabling EtM for openSSH and libssh (again)"
etm@SSH=ENABLE_ETM
echo "Updating system-wide cryptographic policy to:"
read -p "Enter the new policy: " POLICY
read -p "Enter subpolices (comma separated): " SUBPOLICIES
update-crypto-policies --set $POLICY:$SUBPOLICIES
echo "Rebooting system for effective changes"
reboot
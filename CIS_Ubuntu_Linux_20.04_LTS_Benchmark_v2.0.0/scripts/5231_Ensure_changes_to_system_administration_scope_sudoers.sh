auditctl -w /etc/sudoers -p wa -k scope
auditctl -w /etc/sudoers.d -p wa -k scope
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
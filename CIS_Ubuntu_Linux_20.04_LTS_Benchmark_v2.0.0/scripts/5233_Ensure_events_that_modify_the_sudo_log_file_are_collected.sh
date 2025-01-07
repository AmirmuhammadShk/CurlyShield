SUDO_LOG_FILE=$(grep -r logfile /etc/sudoers* | sed -e 's/.*logfile=//;s/,?
.*//' -e 's/"//g')
if [ -n "${SUDO_LOG_FILE}" ]; then
# Add rule to audit rules
printf " -w %s -p wa -k sudo_log_file " "$SUDO_LOG_FILE" >> /etc/audit/rules.d/50-sudo.rules
else
printf "ERROR: Sudo log file is empty\n"
fi
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
else
echo "No reboot required"
fi
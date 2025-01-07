SUDO_LOG_FILE=$(grep -r logfile /etc/sudoers* | sed -e 's/.*logfile=//;s/,? .*/' -e 's/"//g')
if [ -n "${SUDO_LOG_FILE_ESCAPED}" ]; then
printf "# Monitoring events that modify the sudo log file\n"
printf " -w ${SUDO_LOG_FILE} -p wa -k sudo_log_file" >> /etc/audit/rules.d/50-sudo.rules
else
echo "ERROR: Variable 'SUDO_LOG_FILE_ESCAPED' is unset."
fi
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
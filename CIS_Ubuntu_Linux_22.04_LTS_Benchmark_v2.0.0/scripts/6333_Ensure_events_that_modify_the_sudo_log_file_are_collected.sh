SUDO_LOG_FILE=$(grep -r logfile /etc/sudoers* | sed -e 's/.*logfile=//;s/,?
.*//' -e 's/"//g')
if [ -z "${SUDO_LOG_FILE}" ]; then
printf "ERROR: Variable 'SUDO_LOG_FILE' is unset.\n"
fi
printf "%s\n" \
-w ${SUDO_LOG_FILE} -p wa -k sudo_log_file >> /etc/audit/rules.d/50-sudo.rules || {
printf "ERROR: Unable to write rule to /etc/audit/rules.d/50-sudo.rules\n"
}
augenrules --load
if [ $(auditctl -s | grep "enabled") =~ "2" ]; then
printf "Reboot required to load rules\n"
fi
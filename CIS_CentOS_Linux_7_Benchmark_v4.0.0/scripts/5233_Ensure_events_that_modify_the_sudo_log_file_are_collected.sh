SUDO_LOG_FILE=$(grep -r logfile /etc/sudoers* | sed -e 's/.*logfile=//;s/,? \
.*//' -e 's/"//g')
if [ -z "${SUDO_LOG_FILE}" ]; then
echo "ERROR: Variable 'SUDO_LOG_FILE' is unset."
exit 1
fi
augenrules --load
if auditctl -s | grep "enabled" | awk '{print $NF}' == "2"; then
printf "Reboot required to load rules\n"
fi
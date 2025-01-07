if [ ! -f /etc/sudoers ]; then
echo "ERROR: Sudo log file does not exist"
exit 1
fi
SUDO_LOG_FILE=$(grep -r logfile /etc/sudoers* | sed -e 's/.*logfile=//;s/,? .*//' -e 's/"//g')
if [ -z "$SUDO_LOG_FILE" ]; then
echo "ERROR: Variable 'SUDO_LOG_FILE' is unset"
exit 1
fi
augenrules --load
auditctl -s | grep "enabled" > /dev/null 2>&1 || {
printf "Reboot required to load rules\n"
}
-w $SUDO_LOG_FILE -p wa -k sudo_log_file
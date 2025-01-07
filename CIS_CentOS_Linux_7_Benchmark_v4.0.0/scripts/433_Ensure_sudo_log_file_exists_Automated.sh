LOG_FILE_PATH="/var/log/sudo.log"
echo "Defaults logfile=\"$LOG_FILE_PATH\"" | visudo -f /etc/sudoers.d/ 2>/dev/null
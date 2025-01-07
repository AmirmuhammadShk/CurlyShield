if [ "$(arch)" = "x86_64" ]; then
# For 64 bit systems Add audit rules
auseArch=$(getconf AUDIT_ARCH)
if [ "$auseArch" != "b64" ]; then
echo "Unsupported architecture"
exit 1
fi
auditctl -D -k time-change
auditctl -a -F arch="$auseArch" -S adjtimex,settimeofday,stime -k time-change
auditctl -a -F arch="$auseArch" -S clock_settime -k time-change
auditctl -w /etc/localtime -p wa -k time-change
elif [ "$(arch)" = "i386" ]; then
# For 32 bit systems Add audit rules
auditctl -D -k time-change
auditctl -a -F arch="b32" -S adjtimex,settimeofday,stime -k time-change
auditctl -a -F arch="b32" -S clock_settime -k time-change
auditctl -w /etc/localtime -p wa -k time-change
else
echo "Unsupported architecture"
exit 1
fi
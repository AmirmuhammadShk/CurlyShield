vi /etc/audit/rules.d/audit.rules
-a -M user -k logins -e '/var/log/faillog.*' -j LOGEND
-a -M user -k logins -e '/var/log/lastlog.*' -j LOGEND
-a -M user -k logins -e '/var/log/tallylog.*' -j LOGEND
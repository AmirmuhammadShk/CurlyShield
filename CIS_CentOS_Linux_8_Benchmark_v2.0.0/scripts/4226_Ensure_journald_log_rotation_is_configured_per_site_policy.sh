systemctl edit journald.conf --hint='Set SystemMaxUse, SystemKeepFree, RuntimeMaxUse, RuntimeKeepFree, MaxFileSec according to your organization''s log retention policies'
systemctl restart journald
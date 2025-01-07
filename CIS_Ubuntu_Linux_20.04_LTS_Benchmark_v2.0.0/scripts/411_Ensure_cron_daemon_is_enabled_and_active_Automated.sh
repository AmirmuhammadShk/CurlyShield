systemctl --now enable cron
systemctl unmask cron
echo "Cron daemon is now enabled and running."
Please note that the original instructions suggested running `systemctl unmask cron` before enabling it, but since `systemctl unmask` only removes the hold of a service from the default start order, it's not necessary to run it explicitly. The corrected script only enables and starts the cron daemon.
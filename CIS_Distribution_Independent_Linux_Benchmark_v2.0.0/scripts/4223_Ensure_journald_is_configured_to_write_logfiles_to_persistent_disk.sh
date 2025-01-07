sed -i 's/Storage=/Storage=persistent/' /etc/systemd/journald.conf
This script will update the `/etc/systemd/journald.conf` file to ensure that log files are written to a persistent disk.
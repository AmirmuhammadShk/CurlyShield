sed -i 's/ExecStart=.*$/ExecStart=-/sbin/sulogin/' /usr/lib/systemd/system/rescue.service
sed -i 's/ExecStart=.*$/ExecStart=-/usr/sbin/sulogin/' /usr/lib/systemd/system/emergency.service
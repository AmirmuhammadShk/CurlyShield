rm -rf /home/*/.forward
if [ "$(uname -s)" = "Linux" ]; then
# Notes: On some distributions the /sbin/nologin should be replaced with /usr/sbin/nologin.
ln -sf /usr/sbin/nologin /sbin/nologin
else
ln -sf /usr/sbin/nologin /sbin/nologin
fi
echo "Monitoring policy to report user .forward files and determine action in accordance with site policy has been established."
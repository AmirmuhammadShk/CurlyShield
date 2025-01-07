if [ "$(uname -s)" == "Linux" ]; then
systemctl disable ypserv || echo "Failed to disable ypserv"
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
sc config ypserv start= disabled || echo "Failed to disable ypserv"
else
echo "Unsupported Unix Version"
fi
if [ "$(systemctl list-units --type=service | grep nis)" ]; then
systemctl stop nis || echo "Failed to stop nis"
systemctl disable nis || echo "Failed to disable nis"
fi
find /etc /usr/lib /lib /usr/bin -name "*nis*" | xargs rm -rf || echo "Failed to remove nis-related configuration"
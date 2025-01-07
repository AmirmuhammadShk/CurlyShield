if systemctl list-units --type=service | grep -q 'crond\?.service'; then
systemctl unmask "$(systemctl list-unit-files | grep crond.service)"
systemctl enable crond
systemctl start crond
fi
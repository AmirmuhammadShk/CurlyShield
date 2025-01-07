if systemctl list-units --type=service | grep -q 'crond.*'; then
systemctl unmask "$(systemctl list-unit-files | awk '$1~/^crond?\.service/{print $0}' )"
systemctl enable crond@.service
systemctl start crond@.service
fi
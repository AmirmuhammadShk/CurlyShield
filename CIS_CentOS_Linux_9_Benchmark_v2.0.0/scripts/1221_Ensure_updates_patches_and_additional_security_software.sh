sudo dnf update --all
if sudo dnf needs-reboot; then
# If reboot is required, schedule it
sudo systemctl reboot
fi
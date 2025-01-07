yum remove gdm
yum remove -y gnome-desktop-environment gnome-shell gnome-chooser gnome-music gnome-netscape gnome-sudoku gnome-volume-manager
rm -rf /etc/gdm*
systemctl reboot
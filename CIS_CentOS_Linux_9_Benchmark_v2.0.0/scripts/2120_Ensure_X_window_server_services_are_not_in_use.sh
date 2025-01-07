if [ -d /etc/X11 ]; then
sudo rm -rf /etc/X11
fi
sudo dnf remove --allmatches xorg*x11*
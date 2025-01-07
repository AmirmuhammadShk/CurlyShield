if command -v gnome-session-properties > /dev/null 2>&1; then
echo "GNOME Desktop Manager package is installed on the system"
else
echo "GNOME Desktop Manager package is not installed on the system. Recommendation is not applicable."
fi
gdm --version > /dev/null 2>&1 || {
echo "GDM package is not installed"
}
grep -q 'automount' /etc/dconf/db/*
if [ $? -eq 0 ]; then
echo "/org/gnome/desktop/media-handling/automount" > /etc/dconf/db/.lock
else
mkdir /etc/dconf/db/.lock
echo "Created lock file for automount"
echo "/org/gnome/desktop/media-handling/automount" >> /etc/dconf/db/.lock
fi
grep -q 'automount-open' /etc/dconf/db/*
if [ $? -eq 0 ]; then
echo "/org/gnome/desktop/media-handling/automount-open" > /etc/dconf/db/.lock
else
mkdir /etc/dconf/db/.lock
echo "Created lock file for automount-open"
echo "/org/gnome/desktop/media-handling/automount-open" >> /etc/dconf/db/.lock
fi
dconf update
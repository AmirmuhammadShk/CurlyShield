{
# Check if GNOME Desktop Manager is installed. If package isn't installed,
# recommendation is Not Applicable
gnome-desktop-manager-installed=$(command -v gnome3 >= /dev/null 2>&1)
# determine system's package manager
l_pq="dpkg-query -W"
case $UNAME in
Linux*)
if command -v dpkg-query > /dev/null 2>&1; then
;;
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
;;
esac
# Check if GDM is installed
gdm_installed=$(command -v gdm3 >= /dev/null 2>&1 && echo "y" || echo "n")
# Check configuration (If applicable)
if [ "$gdm_installed" = "y" ]; then
# Look for autorun to determine profile in use, needed for remaining tests
l_kfd="/etc/dconf/db/$(grep -Psril '^\h*autorun-never\b' /etc/dconf/db/*/ | awk '{split($(NF-1),a,".");print a[1]}')d"
if [ ! -d "$l_kfd" ]; then
mkdir -p "$l_kfd/locks" || echo "Failed to create locks directory: $?"
dconf update || echo "Failed to update dconf database."
fi
else
gnome-desktop-manager-installed="Not installed"
fi
}
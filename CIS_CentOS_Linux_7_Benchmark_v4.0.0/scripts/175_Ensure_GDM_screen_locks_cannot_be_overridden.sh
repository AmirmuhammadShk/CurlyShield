{
# Check if GNMOE Desktop Manager is installed
l_pkgoutput=""
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
# Check if GDM is installed
gdm_packages=("gdm" "gdm3")
for package in "${gdm_packages[@]}"; do
$l_pq "$package" > /dev/null 2>&1 && l_pkgoutput="y" && echo -e "\n - Package: \"$package\" exists on the system\n - remediating configuration if needed"
done
# Check configuration (If applicable)
if [ -n "$l_pkgoutput" ]; then
# Look for idle-delay to determine profile in use, needed for remaining tests
idle_delay_dir=$(grep -Psril '^\h*idle-delay\h*=\h*uint32\h+\d+\b' /etc/dconf/db/ |
awk -F'/' '{split($(NF-1),a,".");print a[1]}')
idle_delay_file="/etc/dconf/db/$idle_delay_dir.d"
# Look for lock-delay to determine profile in use, needed for remaining tests
lock_delay_dir=$(grep -Psril '^\h*lock-delay\h*=\h*uint32\h+\d+\b' /etc/dconf/db/ |
awk -F'/' '{split($(NF-1),a,".");print a[1]}')
lock_delay_file="/etc/dconf/db/$lock_delay_dir.d"
if [ -d "$idle_delay_file" ]; then
if grep -Prilq '^\h*\/org\/gnome\/desktop\/session\/idle-delay\b' "$idle_delay_file"; then
echo " - \"idle-delay\" is locked in \"$(grep -Pril '^\/org\/gnome\/desktop\/session\/idle-delay' $idle_delay_file)\""
else
echo "creating entry to lock \"idle-delay"""
mkdir -p "/etc/dconf/db/$idle_delay_dir/locks"
echo '/org/gnome/desktop/session/idle-delay' >> "/etc/dconf/db/$idle_delay_file"/locks/00-screensaver
fi
else
echo " - \"idle-delay\" is not set so it can not be locked\n - Please follow Recommendation \"Ensure GDM screen locks when the user is idle\" and follow this Recommendation again"
fi
if [ -d "$lock_delay_file" ]; then
if grep -Prilq '^\h*\/org\/gnome\/desktop\/screensaver\/lock-delay\b' "$lock_delay_file"; then
echo " - \"lock-delay\" is locked in \"$(grep -Pril '^\/org\/gnome\/desktop\/screensaver/lock-delay' $lock_delay_file)\""
else
echo "creating entry to lock \"lock-delay"""
mkdir -p "/etc/dconf/db/$lock_delay_dir/locks"
echo '/org/gnome/desktop/screensaver/lock-delay' >> "$lock_delay_file"/locks/00-screensaver
fi
else
echo " - \"lock-delay\" is not set so it can not be locked\n - Please follow Recommendation \"Ensure GDM screen locks when the user is idle\" and follow this Recommendation again"
fi
else
echo " - GNOME Desktop Manager package is not installed on the system\n  - Recommendation is not applicable"
fi
}
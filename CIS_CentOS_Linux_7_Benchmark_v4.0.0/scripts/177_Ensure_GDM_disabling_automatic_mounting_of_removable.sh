{
# Check if GNOME Desktop Manager is installed. If package isn't installed, recommendation is Not Applicable
l_pkgoutput=""
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
# Check if GDM is installed
for package in gdm gdm3; do
$l_pq "$package" > /dev/null 2>&1 && l_pkgoutput="y" && echo " - Package: \"$package\" exists on the system\n - remediating configuration if needed"
done
# Check configuration (If applicable)
if [ -n "$l_pkgoutput" ]; then
# Look for automount to determine profile in use, needed for remaining tests
l_kfd="/etc/dconf/db/$(grep -Psril '^\h*automount\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}')d"
# Look for automount-open to determine profile in use, needed for remaining tests
l_kfd2="/etc/dconf/db/$(grep -Psril '^\h*automount-open\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}')d"
if [ -d "$l_kfd" ]; then
if grep -Priq '^\h*\/org/gnome\/desktop\/media-handling\/automount\b' "$l_kfd"; then
echo " - \"automount\" is locked in \"$(grep -Pril '^\h*\/org/gnome\/desktop\/media-handling\/automount\b' "$l_kfd")"
else
echo " - creating entry to lock \"automount"""
[ ! -d "$l_kfd"/locks ] && mkdir -p "$l_kfd"/locks
echo '/org/gnome/desktop/media-handling/automount' >> "$l_kfd"/locks/00-media-automount
fi
else
echo " - \"automount\" is not set so it can not be locked\n - Please follow Recommendation \"Ensure GDM automatic mounting of removable media is disabled\" and follow this Recommendation again"
fi
if [ -d "$l_kfd2" ]; then
if grep -Priq '^\h*\/org/gnome\/desktop\/media-handling\/automount-open\b' "$l_kfd2";
then
echo " - \"automount-open\" is locked in \"$(grep -Pril '^\\h*\/org/gnome\/desktop\/media-handling\/automount-open\\b' "$l_kfd2")"
else
echo " - creating entry to lock \"automount-open"""
[ ! -d "$l_kfd2"/locks ] && mkdir -p "$l_kfd2"/locks
echo '/org/gnome/desktop/media-handling/automount-open' >> "$l_kfd2"/locks/00-media-automount
fi
else
echo " - \"automount-open\" is not set so it can not be locked\n - Please follow Recommendation \"Ensure GDM automatic mounting of removable media is disabled\" and follow this Recommendation again"
fi
# update dconf database
dconf update
else
echo " - GNOME Desktop Manager package is not installed on the system\n  - Recommendation is not applicable"
fi
}
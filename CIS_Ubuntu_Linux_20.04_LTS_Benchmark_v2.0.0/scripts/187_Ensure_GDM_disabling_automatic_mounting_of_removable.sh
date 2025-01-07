{
# Check if GNMOE Desktop Manager is installed. If package isn't installed, recommendation is Not Applicable
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
# Check if GDM is installed
gdm_packages=("gdm" "gdm3")
for package in "${gdm_packages[@]}"; do
$l_pq "$package" > /dev/null 2>&1 && l_pkgoutput="y" && echo -e "\n- Package: \"$package\" exists on the system\n- remediating configuration if needed"
done
# Check configuration (If applicable)
if [ -n "$l_pkgoutput" ]; then
automount_key="/etc/dconf/db/$(grep -Psril '^\h*automount\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}')"
if [ -d "$automount_key" ]; then
if grep -Priq '^\h*\/org/gnome\/desktop\/media-handling\/automount\b' "$automount_key"; then
echo " - \"automount\" is locked in \"$(grep -Pril '^\\h*\/org/gnome\/desktop\/media-handling\/automount\\.b' "$automount_key")"
else
echo " - creating entry to lock \"automount"""
mkdir -p "/etc/dconf/db/$automount_key/locks"
echo -e '\n# Lock desktop media-handling automount setting'
echo '/org/gnome/desktop/media-handling/automount' >> "/etc/dconf/db/$automount_key/locks/00-media-automount"
fi
else
echo " - \"automount\" is not set so it can not be locked\n- Please follow Recommendation \"Ensure GDM automatic mounting of removable media is disabled\" and follow this Recommendation again"
fi
automount_open_key="/etc/dconf/db/$(grep -Psril '^\h*automount-open\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}')"
if [ -d "$automount_open_key" ]; then
if grep -Priq '^\h*\/org/gnome\/desktop\/media-handling\/automount-open\b' "$automount_open_key"; then
echo " - \"automount-open\" is locked in \"$(grep -Pril '^\\h*\/org/gnome\/desktop\/media-handling\/automount-open\\.b' "$automount_open_key")"
else
echo " - creating entry to lock \"automount-open"""
mkdir -p "/etc/dconf/db/$automount_open_key/locks"
echo -e '\n# Lock desktop media-handling automount-open setting'
echo '/org/gnome/desktop/media-handling/automount-open' >> "/etc/dconf/db/$automount_open_key/locks/00-media-automount"
fi
else
echo " - \"automount-open\" is not set so it can not be locked\n- Please follow Recommendation \"Ensure GDM automatic mounting of removable media is disabled\" and follow this Recommendation again"
fi
dconf update
else
echo " - GNOME Desktop Manager package is not installed on the system\n- Recommendation is not applicable"
fi
}
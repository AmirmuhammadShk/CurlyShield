l_gpname="local"
if dpkg -q --list | grep -q "gnome-desktop-environment"; then
l_pq="dpkg-query -W"
elif yum list installed gnome-desktop-environment; then
l_pq="yum list installed"
else
echo "Unknown package manager"
exit 1
fi
gdm -v > /dev/null 2>&1 && {
# Get a list of packages to check
for package in $(dpkg --list | grep gdm); do
$l_pq "$package" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$package\" exists on the system\n - checking configuration"
done
# Check configuration (If applicable)
if [ -n "$l_pkgoutput" ]; then
echo -e "$l_pkgoutput"
# Look for existing settings and set variables if they exist
dconf read | grep automount > /dev/null && {
l_kfile=$(dconf read /org/gnome/DesktopEnvironment/media-handling/automount)
l_kfile2=$(dconf read /org/gnome/DesktopEnvironment/media-handling/automount-open)
# Set profile name based on dconf db directory ({PROFILE_NAME}.d)
if [ -n "$l_kfile" ]; then
l_gpname=$(echo "$l_kfile" | cut -d '/' -f1)
echo " - updating dconf profile name to \"$l_gpname\""
elif [ -n "$l_kfile2" ]; then
l_gpname=$(echo "$l_kfile2" | cut -d '/' -f1)
echo " - updating dconf profile name to \"$l_gpname\""
fi
# check for consistency (Clean up configuration if needed)
if [ -n "$l_kfile" ] && [ "$(cut -d '/' -f1 <<< "$l_kfile")" != "$l_gpname" ]; then
sed -i '/^automount=\/# /' "/etc/dconf/db/$l_gpname.d/00-media-automount"
fi
if [ -n "$l_kfile2" ] && [ "$(cut -d '/' -f1 <<< "$l_kfile2")" != "$l_gpname" ]; then
sed -i '/^automount-open=false/' "/etc/dconf/db/$l_gpname.d/00-media-automount"
fi
# check automount-open setting
if grep -qs "automount-open=false" <<< "$l_kfile"; then
echo " - \"automount-open\" is set to false in: \"$l_kfile\""
else
sed -i '/^automount-open=/a\\nautomount-open=false' "/etc/dconf/db/$l_gpname.d/00-media-automount"
fi
# check automount setting
if grep -qs "automount=false" <<< "$l_kfile"; then
echo " - \"automount\" is set to false in: \"$l_kfile\""
else
sed -i '/^automount=/a\\nautomount=false' "/etc/dconf/db/$l_gpname.d/00-media-automount"
fi
# update dconf database
dconf update
} || {
echo "Unknown GDM package"
exit 1
}
else
echo -e "\n GNOME Desktop Manager package is not installed on the system\n  - Recommendation is not applicable"
fi
} || {
echo "Unknown package manager"
exit 1
}
dconf read /org/gnome/DesktopEnvironment > /dev/null && {
l_gpdir="/etc/dconf/db"
if [ -d "$l_gpdir" ]; then
echo " - The dconf database directory \"$l_gpdir\" exists"
else
mkdir -p "$l_gpdir"
fi
} || {
mkdir -p "/etc/dconf/db"
}
if ! dconf read /org/gnome/DesktopEnvironment | grep -qs "media-handling"; then
echo '[org/gnome/desktop/media-handling]' > "/etc/dconf/db/$l_gpname.d/00-media-automount"
fi
if ! dconf read /org/gnome/DesktopEnvironment | grep -qs "automount"; then
echo '\nautomount=false' >> "/etc/dconf/db/$l_gpname.d/00-media-automount"
fi
if ! dconf read /org/gnome/DesktopEnvironment | grep -qs "automount-open"; then
echo '\nautomount-open=false' >> "/etc/dconf/db/$l_gpname.d/00-media-automount"
fi
dconf update
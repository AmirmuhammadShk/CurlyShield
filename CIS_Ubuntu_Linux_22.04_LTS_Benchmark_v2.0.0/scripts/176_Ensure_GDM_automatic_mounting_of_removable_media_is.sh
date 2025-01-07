if command -v gdm > /dev/null; then
# Set to desired dconf profile name (default is local)
l_gpname="local"
# Check if GNOME Desktop Manager is installed.
if [ -n "$(command -v dpkg-query)" ]; then
pq="dpkg-query -s"
elif [ -n "$(command -v rpm)" ]; then
pq="rpm -q"
fi
for pn in "gdm gdm3"; do
$pq "$pn" > /dev/null 2>&1 && pkgoutput+="$pkgoutput\n - Package: \"$pn\" exists on the system\n - checking configuration"
done
if [ -n "$pkgoutput" ]; then
echo -e "$pkgoutput"
# Look for existing settings and set variables if they exist
kfile=$(grep -Prils -- '^\h*automount\b' /etc/dconf/db/*.d)
kfile2=$(grep -Prils -- '^\h*automount-open\b' /etc/dconf/db/*.d)
# Set profile name based on dconf db directory ({PROFILE_NAME}.d)
if [ -f "$kfile" ]; then
gpname=$(awk -F/ '{split($(NF-1),a,".");print a[1]}' <<< "$kfile")
echo " - updating dconf profile name to \"$gpname\""
elif [ -f "$kfile2" ]; then
gpname=$(awk -F/ '{split($(NF-1),a,".");print a[1]}' <<< "$kfile2")
echo " - updating dconf profile name to \"$gpname\""
fi
# Check for consistency (Clean up configuration if needed)
if [ -f "$kfile" ] && [ "$(awk -F/ '{split($(NF-1),a,".");print a[1]}' <<< "$kfile")" != "$gpname" ]; then
sed -ri "/^\s*automount\s*=/s/^/# /" "$kfile"
kfile="/etc/dconf/db/$gpname.d/00-media-automount"
fi
if [ -f "$kfile2" ] && [ "$(awk -F/ '{split($(NF-1),a,".");print a[1]}' <<< "$kfile2")" != "$gpname" ]; then
sed -ri '/^\s*\[org\/gnome\/desktop\/media-handling\]/a \\nautomount-open=false' "$kfile2"
fi
# create dconf directory if it doesn't exists
gpdir="/etc/dconf/db/$gpname.d"
if [ -d "$gpdir" ]; then
echo " - The dconf database directory \"$gpdir\" exists"
else
echo " - creating dconf database directory \"$gpdir]"
mkdir "$gpdir"
fi
# check automount-open setting
if grep -Pqs -- '^\h*automount-open\h*=\h*false\b' "$kfile"; then
echo " - \"automount-open\" is set to false in: \"$kfile]"
else
echo " - creating \"automount-open\" entry in \"$kfile]"
! grep -Psq -- '\^\h*\[org\/gnome\/desktop\/media-handling\]\b' "$kfile" && echo '[org/gnome/desktop/media-handling]' >> "$kfile"
sed -ri '/^\s*\[org\/gnome\/desktop\/media-handling\]/a \\nautomount-open=false' "$kfile"
fi
# check automount setting
if grep -Pqs -- '^\h*automount\h*=\h*false\b' "$kfile"; then
echo " - \"automount\" is set to false in: \"$kfile]"
else
echo " - creating \"automount\" entry in \"$kfile]"
! grep -Psq -- '\^\h*\[org\/gnome\/desktop\/media-handling\]\b' "$kfile" && echo '[org/gnome/desktop/media-handling]' >> "$kfile"
sed -ri '/^\s*\[org\/gnome\/desktop\/media-handling\]/a \\nautomount=false' "$kfile"
fi
# update dconf database
dconf update
else
echo -e "\n - GNOME Desktop Manager package is not installed on the system\n  - Recommendation is not applicable"
fi
else
echo -e "\n - GNOME Desktop Manager package is not installed on the system\n  - Recommendation is not applicable"
fi
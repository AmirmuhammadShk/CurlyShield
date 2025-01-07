l_pkgoutput="" l_output="" l_output2=""
l_gpname="local" # Set to desired dconf profile name (default is local)
installed, recommendation is Not Applicable
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
l_pcl="gdm gdm3" # Space separated list of packages to check
for l_pn in $l_pcl; do
$l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput+=" - Package: \"$l_pn\" exists on the system\n - checking configuration"
done
echo -e "$l_pkgoutput"
if [ -n "$l_pkgoutput" ]; then
# Look for existing settings and set variables if they exist
l_kfile="$(grep -Prils -- '^\h*autorun-never\b' /etc/dconf/db/*.d)"
# Set profile name based on dconf db directory ({PROFILE_NAME}.d)
if [ -f "$l_kfile" ]; then
l_gpname="$(awk -F\/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile")"
echo " - updating dconf profile name to \"$l_gpname\""
# Check if profile file exists
fi
[ ! -f "/etc/dconf/profile/user" ] && l_gpfile="/etc/dconf/profile/user2"
echo -e " - creating dconf database profile"
# Create dconf directory if it doesn't exist
l_gpdir="/etc/dconf/db/$l_gpname.d"
if [ -d "$l_gpdir" ]; then
echo " - The dconf database directory \"$l_gpdir\" exists"
else
echo " - creating dconf database directory \"$l_gpdir\""
mkdir "$l_gpdir"
fi
# Check autorun-never setting
if grep -Pqs -- '^\h*autorun-never\h*=\h*true\b' "$l_kfile"; then
echo " - \"autorun-never\" is set to true in: \"$l_kfile\""
else
echo " - creating or updating \"autorun-never\" entry in \"$l_kfile\""
# Check if org/gnome/desktop/media-handling profile exists
! grep -Psq -- '\^\h*\[org\/gnome\/desktop\/media-handling\]\b' "$l_kfile" && echo '[org/gnome/desktop/media-handling]' >> "$l_kfile"
# Set autorun-never to true
sed -ri 's/(^\s*autorun-never\s*=\s*)(\S+)(\s*.*)$/\1true \3/' "$l_kfile"
fi
dconf update
l_pkgoutput="" l_output="" l_output2=""
l_gpname="local" # Set to desired dconf profile name (default is local)
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
l_pcl="gdm gdm3" # Space separated list of packages to check
for l_pn in $l_pcl; do
$l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput+="- Package: \"$l_pn\" exists on the system\n - checking configuration"
done
echo -e "$l_pkgoutput"
if [ -n "$l_pkgoutput" ]; then
echo -e "\n - updating dconf profile name to \"$l_gpname\""
if grep -Prl -- '^\h*automount\b' /etc/dconf/db/*.d; then
l_kfile=$(grep -Prils -- '^\h*automount\b' /etc/dconf/db/*.d)
l_kfile2=$(grep -Prils -- '^\h*automount-open\b' /etc/dconf/db/*.d)
l_gpname=$(awk -F/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile")
if [ "$(awk -F/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile")" != "$l_gpname" ]; then
sed -ri "/^\s*automount\s*=/s/^/# /" "$l_kfile"
l_kfile="/etc/dconf/db/$l_gpname.d/00-media-automount"
fi
if grep -Prl -- '^\h*automount-open\b' /etc/dconf/db/*.d; then
l_gpname=$(awk -F/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile2")
if [ "$(awk -F/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile2")" != "$l_gpname" ]; then
sed -ri "/^\s*automount-open\s*=/s/^/# /" "$l_kfile2"
fi
fi
else
l_kfile=$(grep -Prils -- '^\h*automount\b' /etc/dconf/db/*.d)
if ! grep -Psq -- '\^\h*\[org\/gnome\/desktop\/media-handling\]\b' "$l_kfile"; then
echo '[org/gnome/desktop/media-handling]' >> "$l_kfile"
fi
l_kfile2=$(grep -Prils -- '^\h*automount-open\b' /etc/dconf/db/*.d)
if grep -Prl -- '^\h*automount-open\h*=\h*false\b' "$l_kfile"; then
echo " - \"automount-open\" is set to false in: \"$l_kfile\""
else
sed -ri '/^\s*\[org\/gnome\/desktop\/media-handling\]/a \\nautomount-open=false' "$l_kfile2"
echo " - creating \"automount-open\" entry in \"$l_kfile2\"\n"
fi
fi
l_kfile=$(grep -Prils -- '^\h*automount\b' /etc/dconf/db/*.d)
if grep -Prl -- '^\h*automount\h*=\h*false\b' "$l_kfile"; then
echo " - \"automount\" is set to false in: \"$l_kfile\""
else
sed -ri '/^\s*\[org\/gnome\/desktop\/media-handling\]/a \\nautomount=false' "$l_kfile"
echo " - creating \"automount\" entry in \"$l_kfile\"\n"
fi
fi
dconf update
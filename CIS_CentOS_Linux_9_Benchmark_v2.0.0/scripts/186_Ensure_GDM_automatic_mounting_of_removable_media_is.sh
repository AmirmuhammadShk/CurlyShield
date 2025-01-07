l_pkgoutput=""
l_gpname="local"
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
l_pcl="gdm gdm3"
for l_pn in $l_pcl; do
$l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
done
if [ -n "$l_pkgoutput" ]; then
echo -e "$l_pkgoutput"
l_kfile="$(grep -Prils -- '^\h*automount\b' /etc/dconf/db/*.d)"
l_kfile2="$(grep -Prils -- '^\h*automount-open\b' /etc/dconf/db/*.d)"
if [ -f "$l_kfile" ]; then
l_gpname="$(awk -F\/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile")"
echo " - updating dconf profile name to \"$l_gpname\""
elif [ -f "$l_kfile2" ]; then
l_gpname="$(awk -F\/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile2")"
echo " - updating dconf profile name to \"$l_gpname\""
fi
if [ -f "$l_kfile" ] && [ "$(awk -F\/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile")" != "$l_gpname" ]; then
sed -ri "/^\s*automount\s*=/s/^/# /" "$l_kfile"
l_kfile="/etc/dconf/db/$l_gpname.d/00-media-automount"
fi
if [ -f "$l_kfile2" ] && [ "$(awk -F\/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile2")" != "$l_gpname" ]; then
sed -ri "/^\s*automount-open\s*=/s/^/# /" "$l_kfile2"
fi
dconf update
else
echo -e "\n - GNOME Desktop Manager package is not installed on the system\n  - Recommendation is not applicable"
fi
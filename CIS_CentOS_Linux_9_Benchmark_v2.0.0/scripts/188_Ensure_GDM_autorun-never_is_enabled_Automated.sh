l_pkgoutput="" l_output="" l_output2=""
l_gpname="local" # Set to desired dconf profile name (default is local)
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
l_pcl="gdm gdm3" # Space separated list of packages to check
for l_pn in $l_pcl; do
$l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
done
echo -e "$l_pkgoutput"
if [ -n "$l_pkgoutput" ]; then
echo -e "$l_pkgoutput"
l_kfile="$(grep -Prils -- '^\h*autorun-never\b' /etc/dconf/db/*.d)"
if [ -f "$l_kfile" ]; then
l_gpname=$(awk -F/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile")
echo " - updating dconf profile name to \"$l_gpname\""
fi
l_kfile="/etc/dconf/db/$l_gpname.d/00-media-autorun" # Set default path
if grep -Pq -- "^\h*system-db:$l_gpname\b" /etc/dconf/profile/*; then
echo -e "\n - dconf database profile exists in: \"$(grep -Pl -- '^\h*system-db:$l_gpname\b' /etc/dconf/profile/*)\""
else
l_kfile="/etc/dconf/profile/user" # Set default path if user directory doesn't exist
echo -e " - creating dconf database profile"
{
echo -e "\nuser-db:user"
echo "system-db:$l_gpname"
} >> "$l_kfile"
fi
l_gpdir="/etc/dconf/db/$l_gpname.d"
if [ -d "$l_gpdir" ]; then
echo " - The dconf database directory \"$l_gpdir\" exists"
else
echo " - creating dconf database directory \"$l_gpdir"""
mkdir -p "$l_gpdir" # Use -p to create parent directories if they don't exist
fi
if grep -Pqs -- '^\h*autorun-never\h*=\h*true\b' "$l_kfile"; then
echo " - \"autorun-never\" is set to true in: \"$l_kfile\""
else
sed -ri 's/(^\s*autorun-never\s*=\s*)(\S+)(\s*.*)$/\1true \3/' "$l_kfile" # Update autorun-never setting
fi
fi
dconf update
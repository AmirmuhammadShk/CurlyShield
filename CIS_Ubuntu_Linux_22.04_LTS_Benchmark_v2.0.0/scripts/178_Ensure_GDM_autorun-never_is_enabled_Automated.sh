l_gpname="local"
installed, recommendation is Not Applicable
if command -v dpkg-query &> /dev/null; then
l_pq="dpkg-query -s"
elif command -v rpm &> /dev/null; then
l_pq="rpm -q"
fi
l_pcl="gdm gdm3" # Space separated list of packages to check
for l_pn in $l_pcl; do
$l_pq "$l_pn" &> /dev/null && l_pkgoutput="$l_pkgoutput\n - Package: \"${l_pn}\" exists on the system\n - checking configuration"
done
echo -e "$l_pkgoutput"
if [ -f "/etc/dconf/db/${l_gpname}.d" ]; then
l_kfile="/etc/dconf/db/${l_gpname}.d"
else
l_kfile="/etc/dconf/db/user.d/00-media-autorun"
fi
if grep -Pq -- "^\h*system-db:${l_gpname}\b" /etc/dconf/profile/*; then
echo -e "\n - dconf database profile exists in: \"$(grep -Pl -- '^\h*system-db:${l_gpname}\b' /etc/dconf/profile/*)\""
else
[ ! -f "/etc/dconf/profile/user" ] && l_gpfile="/etc/dconf/profile/user" || l_gpfile="/etc/dconf/profile/user2"
echo -e " - creating dconf database profile"
echo -e "\nuser-db:user"
echo "system-db:${l_gpname}" >> "$l_gpfile"
fi
if [ ! -d "/etc/dconf/db/${l_gpname}.d" ]; then
echo " - creating dconf database directory \"$l_gpname.d\""
mkdir "/etc/dconf/db/${l_gpname}.d"
fi
if grep -Pqs -- '^\h*autorun-never\h*=\h*true\b' "$l_kfile"; then
echo " - \"autorun-never\" is set to true in: \"$l_kfile\""
else
if ! grep -Psq -- '\^\h*\[org\/gnome\/desktop\/media-handling\]\b' "$l_kfile"; then
echo '[org/gnome/desktop/media-handling]' >> "$l_kfile"
fi
sed -ri 's/(^\s*autorun-never\s*=\s*)(\S+)(\s*.*)$/\1true \3/' "$l_kfile"
fi
dconf update
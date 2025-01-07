l_gpname="local"
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
l_pcl="gdm gdm3"
for l_pn in $l_pcl; do
$l_pq "$l_pn" > /dev/null 2>&1 && echo "- Package: \"$l_pn\" exists on the system - checking configuration"
done
l_kfile=$(grep -Prils -- '^\h*autorun-never\b' /etc/dconf/db/*.d)
if [ -f "$l_kfile" ]; then
l_gpname=$(awk -F/ '{split($(NF-1),a,".");print a[1]}' <<< "$l_kfile")
fi
if grep -Pq -- "^\h*system-db:$l_gpname\b" /etc/dconf/profile/*; then
echo "\n - dconf database profile exists in: \"$(grep -Pl -- '^\h*system-db:$l_gpname\b' /etc/dconf/profile/*)\""
else
l_gpfile="/etc/dconf/profile/user"
if [ ! -f "$l_gpfile" ]; then
echo " - creating dconf database profile"
echo "user-db:user"
echo "system-db:$l_gpname" >> "$l_gpfile"
fi
fi
l_gpdir="/etc/dconf/db/$l_gpname.d"
if [ ! -d "$l_gpdir" ]; then
echo " - creating dconf database directory \"$l_gpdir\""
mkdir "$l_gpdir"
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
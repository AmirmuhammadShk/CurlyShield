{
# Check if GNOME Desktop Manager is installed. If package isn't
# installed, recommendation is Not Applicable
l_pkgoutput="dpkg-query -W"
if dpkg -S /etc/dconf/db | grep -q 'gdm'; then
echo "Package: gdm exists on the system"
else
echo "GNOME Desktop Manager package is not installed on the system\nRecommendation is not applicable"
fi
# Check configuration (If applicable)
if [ -n "$l_pkgoutput" ]; then
# Look for autorun to determine profile in use, needed for remaining tests
key=$(grep -rPsril '^\h*autorun-never\b' /etc/dconf/db/ | awk -F '/' '{print $NF}')
if [ -n "$key" ]; then
echo " - \"autorun-never\" is locked in $(grep -Pril '^\/org/gnome/desktop/media-handling\/autorun-never\b' /etc/dconf/db/$key)"
else
echo " - creating entry to lock \"autorun-never""
mkdir -p /etc/dconf/db/$(dirname $key)/locks
echo '/org/gnome/desktop/media-handling/autorun-never' >> $(dirname $key)/locks/00-media-autorun
fi
# update dconf database
dconf update
else
echo " - GNOME Desktop Manager package is not installed on the system\nRecommendation is not applicable"
fi
}
if ! dpkg -s gnome-session 2>/dev/null; then
echo "GNOME Desktop Manager package is not installed on the system"
echo "Recommendation is not applicable"
else
# Determine system's package manager
case $(dpkg --list-architecture) in
i386) l_pq="dpkg-query -W" ;;
*) l_pq="rpm -q" ;;
esac
# Check if GDM is installed
l_pcl="gdm gdm3"
for pn in $l_pcl; do
output=$( $l_pq "$pn" 2>/dev/null)
if [ $? -eq 0 ]; then
echo "Package: \"$pn\" exists on the system"
echo "remediating configuration if needed"
fi
done
# Check configuration (If applicable)
if [ ! -z "$output" ]; then
l_kfd="/etc/dconf/db/$(awk '{print $1}' /etc/dconf/db/* | grep -Psril '^\h*idle-delay\h*=\h*uint32\h+\d+\b' | head -n 1)"
# Look for idle-delay to determine profile in use, needed for remaining tests
if [ -d "$l_kfd" ]; then
if grep -Prilq '^\h*/org/gnome/desktop/session/idle-delay\b' "$l_kfd"; then
echo "idle-delay is locked in \"$(grep -Prl '^/org/gnome/desktop/session/idle-delay\b' "$l_kfd")"`
else
echo "creating entry to lock idle-delay"
mkdir -p "/etc/dconf/db/$l_kfd/locks"
echo '/org/gnome/desktop/session/idle-delay' >> "/etc/dconf/db/$l_kfd/locks/00-screensaver"
fi
else
echo "idle-delay is not set so it can not be locked"
echo "Please follow Recommendation \"Ensure GDM screen locks when the user is idle\" and follow this Recommendation again"
fi
l_kfd2="/etc/dconf/db/$(awk '{print $1}' /etc/dconf/db/* | grep -Psril '^\h*lock-delay\h*=\h*uint32\h+\d+\b' | head -n 1)"
# Look for lock-delay to determine profile in use, needed for remaining tests
if [ -d "$l_kfd2" ]; then
if grep -Prilq '^\h*/org/gnome/desktop/screensaver/lock-delay\b' "$l_kfd2"; then
echo "lock-delay is locked in \"$(grep -Prl '^/org/gnome/desktop/screensaver/lock-delay\b' "$l_kfd2")"`
else
echo "creating entry to lock lock-delay"
mkdir -p "/etc/dconf/db/$l_kfd2/locks"
echo '/org/gnome/desktop/screensaver/lock-delay' >> "/etc/dconf/db/$l_kfd2/locks/00-screensaver"
fi
else
echo "lock-delay is not set so it can not be locked"
echo "Please follow Recommendation \"Ensure GDM screen locks when the user is idle\" and follow this Recommendation again"
fi
else
echo "GNOME Desktop Manager package is not installed on the system"
echo "Recommendation is not applicable"
fi
# Run dconf update command to update the system databases
dconf update
# Note: Users must log out and back in again before the system-wide settings take effect.
fi
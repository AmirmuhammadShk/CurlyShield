if [ -d /etc/dconf/db ]; then
for dir in $(find /etc/dconf/db -maxdepth 1 -type d); do
if grep -q "idle-delay" "$dir"; then
echo " - \"idle-delay\" is locked in \"$(grep -ril '^\h*\/org\/gnome\/desktop\/session\/idle-delay\b' '$dir')"
elif [ ! -d "${dir}/locks" ]; then
mkdir "${dir}/locks"
echo -e '\n# Lock desktop screensaver idle-delay setting'
echo '/org/gnome/desktop/session/idle-delay' >> "${dir}/locks/00-screensaver"
fi
done
for dir in $(find /etc/dconf/db -maxdepth 1 -type d); do
if grep -q "lock-delay" "$dir"; then
echo " - \"lock-delay\" is locked in \"$(grep -ril '^\h*\/org\/gnome\/desktop\/screensaver\/lock-delay\b' '$dir')"
elif [ ! -d "${dir}/locks" ]; then
mkdir "${dir}/locks"
echo -e '\n# Lock desktop screensaver lock-delay setting'
echo '/org/gnome/desktop/screensaver/lock-delay' >> "${dir}/locks/00-screensaver"
fi
done
else
echo " - \"idle-delay\" is not set so it can not be locked\n - Please follow Recommendation \"Ensure GDM screen locks when the user is idle\" and follow this Recommendation again"
fi
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
for package in gdm gdm3; do
if $l_pq "$package" > /dev/null 2>&1 && [ -n "$l_pqoutput" ]; then
echo " - Package: \"$package\" exists on the system"
echo " - remediating configuration if needed"
fi
done
echo -e "\n# Update system databases"
if command -v dconf update > /dev/null 2>&1; then
echo "Running command to ensure GDM screen locks are enforced."
else
echo "Failed to find 'dconf update' command, skipping system database update"
fi
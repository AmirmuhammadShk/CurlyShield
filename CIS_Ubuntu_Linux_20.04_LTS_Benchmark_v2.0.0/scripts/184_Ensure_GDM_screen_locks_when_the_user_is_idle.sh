{
l_key_file="/etc/dconf/db/local.d/00-screensaver"
l_idmv="900" # Set max value for idle-delay in seconds (between 1 and 900)
l_ldmv="5" # Set max value for lock-delay in seconds (between 0 and 5)
{
echo '# Specify the dconf path'
echo '[org/gnome/desktop/session]'
echo ''
echo '# Number of seconds of inactivity before the screen goes blank'
echo '# Set to 0 seconds if you want to deactivate the screensaver.'
echo "idle-delay=uint32 $l_idmv"
echo ''
echo '# Specify the dconf path'
echo '[org/gnome/desktop/screensaver]'
echo ''
echo '# Number of seconds after the screen is blank before locking the screen'
echo "lock-delay=uint32 $l_ldmv"
} > "$l_key_file"
mkdir -p /etc/dconf/db/local.d/
echo -e '\nuser-db:user\nsystem-db:local' >> /etc/dconf/profile/user
mkdir -p /etc/dconf/db/local.d/
echo "idle-delay=uint32 $l_idmv" >> /etc/dconf/db/local.d/00-screensaver
echo "lock-delay=uint32 $l_ldmv" >> /etc/dconf/db/local.d/00-screensaver
dconf update
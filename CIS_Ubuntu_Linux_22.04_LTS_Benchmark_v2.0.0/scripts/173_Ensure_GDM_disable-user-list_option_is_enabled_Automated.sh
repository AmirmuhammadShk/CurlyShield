l_gdmprofile="gdm"
if [ ! -f "/etc/dconf/profile/$l_gdmprofile" ]; then
echo "Creating profile \"$l_gdmprofile\""
echo -e "user-db:user\nsystem-db:$l_gdmprofile\nfile-
db:/usr/share/$l_gdmprofile/greeter-dconf-defaults" >
/etc/dconf/profile/$l_gdmprofile
fi
if [ ! -d "/etc/dconf/db/$l_gdmprofile.d/" ]; then
echo "Creating dconf database directory \"/etc/dconf/db/$l_gdmprofile.d/\""
mkdir /etc/dconf/db/$l_gdmprofile.d/
fi
if grep -Piq '^\h*disable-user-list\h*=\h*false\b'
/etc/dconf/db/$l_gdmprofile.d/*; then
echo "Creating gdm keyfile for machine-wide settings"
if grep -Pil -- '^\h*\[org\/gnome\/login-screen\]'
/etc/dconf/db/$l_gdmprofile.d/*; then
sed -ri '/^\s*\[org\/gnome\/login-screen\]/ a\# Do not show the user list\ndisable-user-list=true' $(grep -Pil -- '^\h*\[org\/gnome\/login-
screen\]' /etc/dconf/db/$l_gdmprofile.d/*)
fi
echo "disable-user-list=true" >> /etc/dconf/db/$l_gdmprofile.d/00-login-screen
fi
dconf update
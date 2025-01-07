find /etc/bashrc -type f | xargs sed -i 's/TMOUT=//g' || echo "Error: unable to remove TMOUT settings from /etc/bashrc"
find /etc/profile -type f | xargs sed -i 's/TMOUT=//g' || echo "Error: unable to remove TMOUT settings from /etc/profile"
find /etc/profile.d/ -name "*.sh" | xargs sed -i 's/TMOUT=//g' || echo "Error: unable to remove TMOUT settings from files ending in *.sh"
if [ ! -f /etc/bashrc ]; then
cp -p /etc/profile.d/00-timout.sh /etc/bashrc
elif ! grep -q 'TMOUT' /etc/bashrc; then
sed -i '/^#/c\TMOUT=900\nreadonly TMOUT\nexport TMOUT' /etc/bashrc
fi
if [ ! -f /etc/profile ]; then
cp -p /etc/profile.d/00-timout.sh /etc/profile
elif ! grep -q 'TMOUT' /etc/profile; then
sed -i '/^#/c\TMOUT=900\nreadonly TMOUT\nexport TMOUT' /etc/profile
fi
if [ ! -f /etc/profile.d/00-timout.sh ]; then
echo "TMOUT=900" >> /etc/profile.d/00-timout.sh
chmod +x /etc/profile.d/00-timout.sh
fi
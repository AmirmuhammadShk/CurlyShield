for l_mdir in /lib/modules/**/kernel/fs; do
if [ -d "$l_mdir/$l_mname" ] && [ -n "$(ls -A $l_mdir/$l_mname)" ]; then
# If the module is currently loadable, add "install jffs2 /bin/false" to a file in /etc/modprobe.d
if grep -Pq -- "(^\h*install|\b$jffs2)\b" <<< "$(modprobe -n -v "$jffs2")"; then
echo -e "\n - setting module: \"$jffs2\" to be not loadable"
echo "install $jffs2 /bin/false" >> /etc/modprobe.d/"$l_mpname".conf
fi
# If the module is currently loaded, unload the module
if lsmod | grep "$jffs2" > /dev/null 2>&1; then
echo -e "\n - unloading module \"$jffs2\""
modprobe -r "$jffs2"
fi
# If the module isn't listed, denylist the module
if ! grep -Pq -- "^\h*blacklist\h+$l_mpname\b" <<< "$(modprobe --showconfig)"; then
echo -e "\n - deny listing \"$jffs2\""
echo "blacklist $jffs2" >> /etc/modprobe.d/"$l_mpname".conf
fi
else
# If the module doesn't exist, print a message
echo -e "\n - module: \"$jffs2\" doesn't exist in `/lib/modules/$(uname -r)/kernel/fs\"\n"
fi
done
echo "blacklist $jffs2" >> /etc/modprobe.d/"$l_mpname".conf
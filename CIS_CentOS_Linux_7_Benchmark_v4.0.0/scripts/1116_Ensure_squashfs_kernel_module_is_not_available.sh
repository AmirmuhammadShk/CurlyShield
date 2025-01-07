mname="squashfs"
mtype="fs"
mpath="/lib/modules/**/kernel/$mtype"
if [ -d "$mpath" ]; then
# Create a file ending in .conf with blacklist squashfs in the /etc/modprobe.d/
echo "blacklist $mname" >> /etc/modprobe.d/"$(tr '-' '_' <<< "$mname")".conf
# Check if the module is currently loaded
if lsmod | grep "$mname" > /dev/null 2>&1; then
# Unload the module
modprobe -r "$mname"
fi
fi
{
l_mname="jffs2" # set module name
l_mtype="fs" # set module type
l_mpath="/lib/modules/**/kernel/$l_mtype"
l_mpname="$(tr '-' '_' <<< "$l_mname")"
l_mndir="$(tr '-' '/' <<< "$l_mname")"
if grep -qP "^install.*$l_mname\b" /etc/modprobe.d/*; then
echo "Removing install parameter for $l_mname module"
sed -i '/^install.*$l_mname/bd' /etc/modprobe.d/*
fi
if ! grep -qP '^blacklist\s+\(.*jffs2\b' /etc/modprobe.d/*; then
echo "Blacklisting jffs2 module"
echo "blacklist $l_mname" >> /etc/modprobe.d/$l_mpname.conf
fi
if lsmod | grep "$l_mname"; then
echo "Unloading jffs2 module"
modprobe -r "$l_mname"
fi
for l_mdir in $l_mpath; do
if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
echo "Module exists in directory: $l_mdir"
blacklisting_fix
unloading_fix
fi
done
echo "Remediation of jffs2 module complete"
}
function blacklisting_fix {
if ! grep -qP '^\s*blacklist\s+\(.*jffs2\b' /etc/modprobe.d/*; then
echo "Blacklisting jffs2 module"
echo "blacklist $l_mname" >> /etc/modprobe.d/$l_mpname.conf
fi
}
function unloading_fix {
if lsmod | grep "$l_mname"; then
echo "Unloading jffs2 module"
modprobe -r "$l_mname"
fi
}
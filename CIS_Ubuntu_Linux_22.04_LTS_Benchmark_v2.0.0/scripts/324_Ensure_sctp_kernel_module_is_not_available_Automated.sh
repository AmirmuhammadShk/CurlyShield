l_mname="sctp"
l_mtype="net"
l_mpath="/lib/modules/**/kernel/$l_mtype"
if grep -Pq -- "^\h*blacklist\h+$l_mpname\b" /etc/modprobe.d/*; then
echo -e "\n - deny listing \"$l_mname\""
echo -e "blacklist $l_mname" >> /etc/modprobe.d/"$l_mpname".conf
fi
if [ "$(modprobe -n -v "$l_mname")" ]; then
# Create a file to disable the module
echo -e "\n - setting module: \"$l_mname\" to be not loadable"
echo -e "install $l_mname /bin/false" >> /etc/modprobe.d/"$l_mpname".conf
# Unload the module from the kernel
if lsmod | grep "$l_mname" > /dev/null 2>&1; then
echo -e "\n - unloading module \"$l_mname"`
modprobe -r "$l_mname"
fi
else
echo -e "\n - module: \"$l_mname\" doesn't exist in any installed kernel. No remediation necessary."
fi
echo -e "\n - remediation of module: \"$l_mname\" complete"
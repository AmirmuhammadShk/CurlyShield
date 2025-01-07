mname="hfsplus"
mtype="fs"
kernel_version=$(uname -r)
module_path="/lib/modules/$kernel_version/kernel/$mtype"
echo "blacklist $mname" > "${mname}_blacklist.conf"
if modprobe -n -v "$mname"; then
echo -e "\n - unloading module \"$mname\""
modprobe -r "$mname"
fi
for dir in $module_path; do
if [ -d "$dir" ]; then
# If the module is present, check its loadability and apply remediation
echo -e "\n - module: \"$mname\" exists in \"$dir\"\n - checking if disabled..."
modprobe -r "$mname"
if [ "$dir" = "/lib/modules/$kernel_version/kernel/$mtype" ]; then
echo "install $mname /bin/false" >> "${mname}_blacklist.conf"
fi
else
# If the module is not present, log a message indicating this
echo -e "\n - module: \"$mname\" doesn't exist in \"$dir\"\n"
fi
done
echo -e "\n - remediation of module: \"$mname\" complete"
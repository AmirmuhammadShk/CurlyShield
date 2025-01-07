l_mname="udf"
l_mtype="fs"
l_mpath="/lib/modules/**/kernel/$l_mtype"
l_mpname=$(tr '-' '_' <<< "$l_mname")
l_mndir=$(tr '-' '/' <<< "$l_mname")
if modprobe -n -v "$l_mname" > /dev/null 2>&1; then
# Create a file to blacklist the module
echo "blacklist $l_mname" >> /etc/modprobe.d/"$l_mpname".conf
# Unload udf from the kernel
modprobe -r "$l_mname"
else
# If the module is not available, no remediation is necessary
echo -e "\n - No remediation needed for $l_mname"
fi
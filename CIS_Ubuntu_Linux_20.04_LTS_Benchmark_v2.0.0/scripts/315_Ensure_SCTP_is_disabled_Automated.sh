if [ "$(uname -s)" != "Linux" ]; then
exit 1
fi
module_name="sctp"
module_type="net"
module_path="/lib/modules/$((uname -r))/kernel/${module_type}"
module_name_safe=$(tr '-' '_' <<< "$module_name")
module_name_dir=$(tr '-' '/' <<< "$module_name")
if modprobe -n -v "$module_name" &>/dev/null; then
echo "Module is available in the running kernel. Disabling..."
echo "install $module_name /bin/false" > "${module_path}/${module_name_safe}.conf"
echo "blacklist ${module_name}" >> "${module_path}/${module_name_safe}.conf"
if [ "$module_name_dir" = "$module_path" ]; then
modprobe -r "$module_name"
echo "Unloading module $module_name"
fi
else
echo "Module is not available in the running kernel. No remediation necessary."
fi
echo "Remediation of module $module_name complete."
set -euo pipefail
module_name="rds"
module_type="net"
if grep -Pq -- "(^\h*blacklist\b|$module_name)" /etc/modprobe.d/*; then
echo "Module $module_name already disabled."
else
# Check if module is available in the running kernel
l_mpath="/lib/modules/**/kernel/$module_type"
for dir in $(find "$l_mpath" -type d); do
mndir=$(basename "$dir")
if [ -n "$(ls -A "$dir/$mndir")" ]; then
echo "Module $module_name exists in $dir"
module_deny_fix
break
fi
done
# If module doesn't exist, no remediation is necessary
else
echo "Module $module_name not available on the system."
fi
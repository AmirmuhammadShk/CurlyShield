if [ "$(uname -r)" ]; then
# Create a file with install udf /bin/false in the /etc/modprobe.d/ directory
echo "install udf /bin/false" >> /etc/modprobe.d/disable_udf.conf
# Create a file with blacklist udf in the /etc/modprobe.d/ directory
echo "blacklist udf" >> /etc/modprobe.d/disable_udf.conf
# Unload udf from the kernel
modprobe -r udf
else
# No remediation is necessary if the kernel module is not available on the system or pre-compiled into the kernel
fi
for module in $(ls /lib/modules/**/kernel/$(uname -r)/fs); do
if [ -d "$module" ] && [ -n "$(ls -A $module)" ]; then
echo "Module: udf exists in $module"
# If available in ANY installed kernel, denylist the module
echo "blacklist udf" >> /etc/modprobe.d/disable_udf.conf
# If the module is currently loadable, add "install {MODULE_NAME} /bin/false" to a file in /etc/modprobe.d
if modprobe -n -v udf; then
install_udf=$(grep -P "(^\h*install|\budf)\b" <<< $(modprobe -n -v udf))
echo "Module: udf is currently loadable. Disabling it..."
echo "install udf /bin/false" >> /etc/modprobe.d/disable_udf.conf
fi
else
echo "Module: udf doesn't exist in $module"
fi
done
echo "Remediation of module udf complete"
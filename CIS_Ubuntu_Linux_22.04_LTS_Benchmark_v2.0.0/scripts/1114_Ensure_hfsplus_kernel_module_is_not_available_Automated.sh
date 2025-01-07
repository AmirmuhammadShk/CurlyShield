for l_mdir in /lib/modules/**/kernel/$l_mtype; do
if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
echo "Module: $l_mname exists in $l_mdir"
module_deny_fix
if [ "$l_mdir" = "/lib/modules/$(uname -r)/kernel/$l_mtype" ]; then
module_loadable_fix
module_loaded_fix
fi
else
echo "Module: $l_mname doesn't exist in $l_mdir"
fi
done
echo "Remediation of module: $l_mname complete"
if ! grep -Pq -- "(^\h*install|\b$hfsplus\b)" /etc/modprobe.d/*.conf; then
echo "Blacklist $hfsplus" >> /etc/modprobe.d/hfsplus.conf
fi
modprobe --reload | grep -v $hfsplus
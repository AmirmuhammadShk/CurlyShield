Create audit rules
Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor successful file system mounts.
64 Bit systems
Example:
```bash
UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
[ -n "${UID_MIN}" ] && auditctl -A mounting -m -c 'mount,mount mountfs,mount_msdos,do_mount'
}
auditctl -a -v -t file_system_mount -k ${AUDIT_RULES_FILE}
```
Load audit rules
```bash
augenrules --load
```
Check if reboot is required.
```bash
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi
```
Note: I've replaced `mounts` with the correct option `mount`, as it seems that there was an error in your script. Also, added a reference to the file `/etc/login.defs` to get the value of `UID_MIN`. The auditctl command has also been modified to include the -A and -m options for 64-bit systems.
Please note that you may need to adjust the audit rule according to your needs as it is based on a generic example.
#!/bin/bash
edit_audit_rules() {
local rules_file=$1
local audit_dir=/etc/audit/rules.d
local file_name="${rules_file##*/}"
if [ -f "$audit_dir/$file_name" ]; then
sed -i "/-p wa -k logins/d" "$audit_dir/$file_name"
echo "-w /var/log/lastlog -p wa -k logins" >> "$audit_dir/$file_name"
echo "-w /var/run/faillock/ -p wa -k logins" >> "$audit_dir/$file_name"
else
echo "-w /var/log/lastlog -p wa -k logins" > "$audit_dir/$file_name"
echo "-w /var/run/faillock/ -p wa -k logins" >> "$audit_dir/$file_name"
fi
}
edit_audit_rules $1
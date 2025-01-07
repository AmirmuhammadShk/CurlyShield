#!/bin/bash
if [ "$(uname -m)" = "x86_64" ]; then
# For 64 bit systems
audit_rule="a always,exit -F arch=b64 -S mount -F auid>=500 -F auid!=4294967295 -k mounts"
elif [ "$(uname -m)" = "i386" ]; then
# For 32 bit systems
audit_rule="a always,exit -F arch=b32 -S mount -F auid>=500 -F auid!=4294967295 -k mounts"
fi
echo "$audit_rule" >> /etc/audit/rules.d/10-mounts.rules
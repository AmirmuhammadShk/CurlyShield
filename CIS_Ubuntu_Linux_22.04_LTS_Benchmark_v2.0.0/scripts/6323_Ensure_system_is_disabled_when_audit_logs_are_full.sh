#!/bin/bash
echo "Setting disk full action to halt" >> /etc/audit/auditd.conf
sed -i 's/disk_full_action=.*/disk_full_action=halt/' /etc/audit/auditd.conf
echo "Setting disk error action to halt" >> /etc/audit/auditd.conf
sed -i 's/disk_error_action=.*/disk_error_action=halt/' /etc/audit/auditd.conf
#!/bin/bash
visudo -f /etc/sudoers
echo "Warning: All existing NOPASSWD lines will be removed without warning" | tee -i /etc/sudoers
visudo -f /etc/sudoers
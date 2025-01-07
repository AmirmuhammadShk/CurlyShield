#!/bin/bash
sed -i 's/.*password.*pam_unix.so/\
password    sufficient   pam_unix.so sha512 shadow try_first_pass use_authtok/' \
/etc/pam.d/system-auth
sed -i 's/.*password.*pam_unix.so/\
password    sufficient   pam_unix.so sha512 shadow try_first_pass use_authtok/' \
/etc/pam.d/password-auth
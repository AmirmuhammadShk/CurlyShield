find /etc/profile.d/ -type f -name "*.sh" -exec sed -i 's/^umask \([0-7][0-7][01][0-7]\b\|\\[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]\\\b\|[0-7][0-7][0-6]\b\|\\[rwx]{1,3}(o=[rwx]{0,3})?\b//umask 027' {} +
find /etc/profile -type f -name "*.profile" -exec sed -i 's/^umask \([0-7][0-7][01][0-7]\b\|\\[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]\\\b\|[0-7][0-7][0-6]\b\|\\[rwx]{1,3}(o=[rwx]{0,3})?\b//umask 027' {} +
find /etc/bashrc -type f -exec sed -i 's/^umask \([0-7][0-7][01][0-7]\b\|\\[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]\\\b\|[0-7][0-7][0-6]\b\|\\[rwx]{1,3}(o=[rwx]{0,3})?\b//umask 027' {} +
sed -i 's/^#umask 027/umask 027/' /etc/profile.d/set_umask.sh
grep -RPi '(^|^[^#]*)\s*umask\s+([0-7][0-7][01][0-7]\b|[0-7][0-7][0-6]\b|[0-7][01][0-7]\b|[0-7][0-7][0-
6]\b|(u=[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]+\b|(u=[rwx]{1,3},)?g=[^rx]{1,3}(
,o=[rwx]{0,3})?\b)' /etc/login.defs
find /etc/profile* -type f -exec grep -lP '(^|^[^#]*)\s*umask\s+([0-7][0-7][01][0-7]\b|[0-7][0-7][0-6]\b|[0-7][01][0-7]\b|[0-7][0-7][0-
6]\b|(u=[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]+\b|(u=[rwx]{1,3},)?g=[^rx]{1,3}(
,o=[rwx]{0,3})?\b)' {} + | xargs -d '\n' sed -i 's/^umask \([0-7][0-7][01][0-7]\b\|\\[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]\\\b\|[0-7][0-7][0-6]\b\|\\[rwx]{1,3}(o=[rwx]{0,3})?\b//umask 027'
find /etc/bashrc -type f -exec grep -lP '(^|^[^#]*)\s*umask\s+([0-7][0-7][01][0-7]\b|[0-7][0-7][0-6]\b|[0-7][01][0-7]\b|[0-7][0-7][0-
6]\b|(u=[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]\\\b\|[0-7][0-7][0-6]\b\|\\[rwx]{1,3}(o=[rwx]{0,3})?\b//umask 027' {} + | xargs -d '\n' sed -i 's/^umask \([0-7][0-7][01][0-7]\b\|\\[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]\\\b\|[0-7][0-7][0-6]\b\|\\[rwx]{1,3}(o=[rwx]{0,3})?\b//umask 027' {}
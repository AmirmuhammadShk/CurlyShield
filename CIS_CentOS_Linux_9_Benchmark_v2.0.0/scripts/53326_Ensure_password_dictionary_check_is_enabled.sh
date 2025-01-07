sed -ri 's/^\s*dictcheck\s*=/dictcheck=1/' /etc/security/pwquality.conf.d/*.conf
sed -ri 's/^\s*dictcheck\s*=\s*\S+$/dictcheck=1/' /etc/security/pwquality.conf
authselect=$(head -1 /etc/authselect/authselect.conf | grep custom/)
sed -ri 's/^\s*(password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+dictcheck\s*=\s*\S+)(.*)$/\1\3/' "$authselect"
authselect apply-changes
sed -i 's/^gpgcheck\s*=\s*.*/gpgcheck=1/' /etc/dnf/dnf.conf
find /etc/yum.repos.d/ -name "*.repo" -exec sed -i 's/^gpgcheck\s*=\s*.*/gpgcheck=1/' {} \;
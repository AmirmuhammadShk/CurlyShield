sed -i 's/^gpgcheck\s*=\s*.*/gpgcheck=1/' /etc/yum.conf
find /etc/yum.repos.d/ -name "*.repo" | xargs sed -ri 's/^gpgcheck\s*=\s*.*/gpgcheck=1/'
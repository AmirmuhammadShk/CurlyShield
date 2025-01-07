sed -i '/^\[main\]/ s/gpgcheck=0/gpgcheck=1' /etc/yum.conf
find /etc/yum.repos.d -name "*.repo" -exec sed -i 's/gpgcheck=\([^\)]\)/gpgcheck=1/' {} \;
sudo sed -i '/^gpgcheck/s/=.*/=1/' /etc/dnf/dnf.conf
find /etc/yum.repos.d/ -name "*.repo" | xargs -I {} sudo sed -i 's/^gpgcheck\s*=\s*.*/gpgcheck=1/' {}
find /etc/yum.repos.d/ -name "*.repo" | xargs -I {} bash -c "sudo sed -i 's/^gpgcheck\s*=\s*.*/gpgcheck=1/' {}",
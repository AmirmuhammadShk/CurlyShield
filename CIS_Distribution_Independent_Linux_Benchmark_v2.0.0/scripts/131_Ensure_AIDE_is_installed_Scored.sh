if [ -x /usr/bin/yum ]; then
yum install -y aide && \
echo "AIDE installed using yum"
elif [ -x /usr/bin/dnf ]; then
dnf install -y aide && \
echo "AIDE installed using dnf"
elif [ -x /usr/bin/apt-get ]; then
apt-get update && \
apt-get install -y aide && \
echo "AIDE installed using apt-get"
elif [ -x /usr/bin/zypper ]; then
zypper refresh && \
zypper install -y aide && \
echo "AIDE installed using zypper"
else
emerge -av --ask yes aide && \
echo "AIDE installed using emerge"
fi
echo "Configure AIDE as appropriate for your environment. Consult the AIDE documentation for options."
aide --init
echo "AIDE initialized"
echo "All done!"
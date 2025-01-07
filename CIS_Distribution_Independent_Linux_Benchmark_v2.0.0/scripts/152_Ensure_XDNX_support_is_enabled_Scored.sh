if [ "$(uname -m)" == "x86_64" ]; then # 64 bit system
echo "No installation required"
elif [ "$(uname -m)" == "i386" ]; then # 32 bit system
apt-get update && \
apt-get install linux-PAE
fi
if [ "$(uname -s)" != "Linux" ]; then # Non-Linux system
echo "Unsupported platform"
elif [ "$(lsb_release -i)" == "Ubuntu" ] || [ "$(lsb_release -i)" == "Debian" ]; then # Ubuntu or Debian based system
dpkg-reconfigure linux-image-PAE
fi
if grep -q 'nx' /proc/cpuinfo; then
echo "NX support already enabled"
elif [ "$(uname -m)" == "x86_64" ]; then # 64 bit system
echo "No action required (NX support should be enabled by default)"
else # 32 bit system
echo "Enable NX support in BIOS"
fi
if grep -q 'pae' /proc/cpuinfo; then
echo "PAE support already enabled"
elif [ "$(uname -m)" == "x86_64" ]; then # 64 bit system
echo "No action required (PAE support should be enabled by default)"
else # 32 bit system
echo "Enable PAE support in BIOS"
fi
if [ -n "$1" ]; then
service_name=$1
yum remove $service_name
else
echo "Error: Service name not provided"
exit 1
fi
if [ -n "$2" ]; then
package_name=$2
yum install --skip-broken $package_name || true
systemctl mask $service_name.socket && systemctl stop $service_name.socket && systemctl mask $service_name.service && systemctl stop $service_name.service
else
echo "Error: Package name not provided"
exit 1
fi
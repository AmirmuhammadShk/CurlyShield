service_name="your_service_name"
package_name="your_package_name"
sudo apt purge $package_name
sudo systemctl stop $service_name.socket $service_name.service
if [ $? -eq 0 ]; then
sudo systemctl mask $service_name.socket $service_name.service
fi
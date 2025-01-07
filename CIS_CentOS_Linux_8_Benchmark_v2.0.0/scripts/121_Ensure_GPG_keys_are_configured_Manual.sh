sudo apt update && sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv 3D7C0EEB6AE66BD31EDBBAB395EDF267CFC4FABC
if ! grep -q '^[a-zA-Z0-9]{11}=.*' /etc/apt/trusted.gpg; then
echo "GPG keys not configured, please follow site policy to update"
else
echo "GPG keys already configured"
fi
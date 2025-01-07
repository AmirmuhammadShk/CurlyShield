sudo apt update -q
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
echo "Repository URL: https://apt.getxk.com" | sudo tee /etc/apt/sources.list.d/getxk.list
curl -sSL https://getxk.com/keys/public.key | sudo apt-key add -
sudo apt update && sudo apt full-upgrade -y
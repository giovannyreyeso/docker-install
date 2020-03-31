echo "makeing update.."
sudo apt-get update
echo "Install packages to allow apt to use a repository over HTTPS:"
 sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
echo "Add Docker’s official GPG key:"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "Verify that you now have the key with the fingerprint"
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo "makeing update again"
sudo apt-get update
echo "installing docker..."
sudo apt-get install -y docker-ce
sudo groupadd docker
sudo usermod -aG docker $USER
echo "Ready for use docker wihout sudo"
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sudo exit

#***** Docker *****

curl -fsSL https://download.docker.com/linux/raspbian/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

echo "deb [arch=armhf] https://download.docker.com/linux/raspbian \
     $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update

#apt-cache madison docker-ce

sudo apt-get install -y docker-ce=18.06.1~ce~3-0~raspbian

sudo usermod pi -aG docker
newgrp docker
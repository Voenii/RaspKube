sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove

#sudo swapon --summary

#sudo nano /boot/cmdline.txt

#gpu_mem=16 cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory smsc95xx.macaddr=b8:27:eb:00:00:02
sudo sh -c "echo ' cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory' >> /boot/cmdline.txt"

#add at end of line with space between and NO [Enter]: 
#cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory
#[Ctrl]+[o] => [Enter] => [Ctrl]+[x]

sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    raspberrypi-kernel-headers \
    software-properties-common \
    git \
    python3-pip \
    apache2-utils \
    ansible \
    sshpass 

sudo apt-get update

sudo reboot

	
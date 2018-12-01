# sudo nano /etc/dhcpcd.conf
# interface eth0
# static ip_address=10.0.0.1/8
# static domain_name_servers=8.8.8.8,8.8.4.4
# nolink

sudo sh -c "echo 'interface eth0' >> /etc/dhcpcd.conf"
sudo sh -c "echo 'static ip_address=10.0.0.1/8' >> /etc/dhcpcd.conf"
sudo sh -c "echo 'static domain_name_servers=8.8.8.8,8.8.4.4' >> /etc/dhcpcd.conf"
sudo sh -c "echo 'nolink' >> /etc/dhcpcd.conf"

# Install dnsmasq
sudo apt install dnsmasq -y

# Move it's default config file for safe-keeping
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.old

# Make a new configuration file for dnsmasq
sudo nano /etc/dnsmasq.conf

sudo sysctl net.ipv4.ip_forward=1

#sudo nano /etc/sysctl.conf
#Uncomment
#net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
sudo iptables -A FORWARD -i eth1 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT

sudo apt install iptables-persistent -y

sudo rm /etc/hostname -rf
sudo sh -c "echo 'router01' >> /etc/hostname"
sudo hostname router01

sudo reboot

#Show leases
cat /var/lib/misc/dnsmasq.leases
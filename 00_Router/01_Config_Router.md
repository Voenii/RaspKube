sudo nano /etc/dhcpcd.conf


interface eth0
static ip_address=10.0.0.1/8
static domain_name_servers=8.8.8.8,8.8.4.4
nolink


# Install dnsmasq
sudo apt install dnsmasq

# Move it's default config file for safe-keeping
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.old

# Make a new configuration file for dnsmasq
sudo nano /etc/dnsmasq.conf

sudo reboot


sudo nano /etc/sysctl.conf

#Uncomment
net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
sudo iptables -A FORWARD -i eth1 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT

sudo apt install iptables-persistent -y


#Show leases
cat /var/lib/misc/dnsmasq.leases
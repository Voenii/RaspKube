#***** Kubernetes: ONLY on NODES *****

#used with Flannel
sudo sysctl net.bridge.bridge-nf-call-iptables=1

#Change Hostname
sudo raspi-config

#after restart
sudo ssh-keygen #defaults ar fine


sudo kubeadm join 10.0.1.1:6443 --token [YOURTOKEN] --discovery-token-ca-cert-hash sha256:[YOURHASH]

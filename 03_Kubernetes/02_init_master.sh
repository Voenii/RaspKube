#***** Kubernetes - ONLY on MASTER *****

#***** Optional *****
kubeadm config images pull


#sudo kubeadm init --apiserver-advertise-address=192.168.5.111 --token-ttl=0 --pod-network-cidr=10.244.0.0/16 --config kubeadm_conf.yaml
#sudo kubeadm init --apiserver-advertise-address=192.168.5.111 --token-ttl=0 --config=kubeadm_conf.yaml
sudo kubeadm init --token-ttl=0 --pod-network-cidr=10.244.0.0/16 

# => Save JOIN Token

#maybe not needed
#sudo sed -i 's/failureThreshold: 8/failureThreshold: 20/g' /etc/kubernetes/manifests/kube-apiserver.yaml

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#WeaveNet
#kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
#kubectl apply -f "https://cloud.weave.works/k8s/scope.yaml?k8s-version=$(kubectl version | base64 | tr -d '\n')"

#Flannel
#kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/c5d10c8/Documentation/kube-flannel.yml
#curl -sSL https://rawgit.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml | sed "s/amd64/arm/g" | kubectl create -f -
#curl -sSL https://github.com/coreos/flannel/blob/master/Documentation/kube-flannel.yml | sed "s/amd64/arm/g" | kubectl create -f -
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

#Optional
echo "adding these parameters"
echo "- --node-monitor-period=2s"
echo "- --node-monitor-grace-period=16s"
echo "- --pod-eviction-timeout=10s"

sudo nano /etc/kubernetes/manifests/kube-controller-manager.yaml
#    - --node-monitor-period=2s
#    - --node-monitor-grace-period=16s 
#    - --pod-eviction-timeout=10s
	

# Taint the master node so application pods can run on it too
#kubectl taint nodes --all node-role.kubernetes.io/master-
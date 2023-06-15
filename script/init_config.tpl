apiVersion: kubeadm.k8s.io/v1beta3
kind: InitConfiguration
localAPIEndpoint:
  advertiseAddress: ${API_SERVER_LOCAL_IP}
  bindPort: 6443
---
apiVersion: kubeadm.k8s.io/v1beta2
kind: ClusterConfiguration
apiServer:
  certSANs:
  - ${API_SERVER_PUBLIC_IP}
certificatesDir: /etc/kubernetes/pki
clusterName: kubernetes
imageRepository: registry.aliyuncs.com/google_containers
---
apiVersion: kubelet.config.k8s.io/v1beta1
kind: KubeletConfiguration
cgroupDriver: systemd

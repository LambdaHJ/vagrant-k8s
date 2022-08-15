apiVersion: kubeadm.k8s.io/v1beta3
kind: InitConfiguration
localAPIEndpoint:
  advertiseAddress: ${API_SERVER_LOCAL_IP}
  bindPort: 6443
---
kind: ClusterConfiguration
apiServer:
  certSANs:
  - ${API_SERVER_LOCAL_IP}
  - ${API_SERVER_PUBLIC_IP}
apiVersion: kubeadm.k8s.io/v1beta3
certificatesDir: /etc/kubernetes/pki
clusterName: kubernetes
imageRepository: registry.aliyuncs.com/google_containers
networking:
  serviceSubnet: ${SERVICE_CIDR}
  podSubnet: ${POD_CIDR}
---
apiVersion: kubeproxy.config.k8s.io/v1alpha1
kind: KubeProxyConfiguration
mode: ipvs


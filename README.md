# vagrant-k8s

## kubernetes 源

``` bash
kubeadm init --image-repository='registry.cn-hangzhou.aliyuncs.com/google_containers'
```

## 创建k8s集群

### 修改配置文件

```
vim config.yaml
```

```
apiVersion: kubeadm.k8s.io/v1beta2
kind: InitConfiguration
localAPIEndpoint:
  advertiseAddress: 192.168.121.155
  bindPort: 6443
---
kind: ClusterConfiguration
apiServer:
  certSANs:
  - 192.168.1.100
apiVersion: kubeadm.k8s.io/v1beta2
certificatesDir: /etc/kubernetes/pki
clusterName: kubernetes
imageRepository: registry.aliyuncs.com/google_containers
networking:
  dnsDomain: cluster.local
  serviceSubnet: 172.16.0.0/24
  podSubnet: 192.168.255.0/24
---
apiVersion: kubeproxy.config.k8s.io/v1alpha1
kind: KubeProxyConfiguration
mode: ipvs

```
修改advertiseAddress地址为master地址
如需在外部访问apiserver, 请修改certSANs添加自己的额外授权地址

其他地址根据情况修改

### 赋值config.yaml到master 


### 初始化集群

```
sudo kubeadm init --config ./config.yaml
```
如需修改镜像源，请添加--image-reposotory配置

### 安装CNI

calico
```
kubectl apply -f https://projectcalico.docs.tigera.io/manifests/calico.yaml
```

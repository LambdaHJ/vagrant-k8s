# vagrant-k8s

### 初始化集群

```
sudo ./script/create-cluster.sh
```

### 安装CNI

cilium
```
helm repo add cilium https://helm.cilium.io/


helm upgrade cilium cilium/cilium --version 1.13.3 --namespace kube-system --set kubeProxyReplacement=strict --set k8sServiceHost=${API_SERVER_LOCAL_IP} --set k8sServicePort=6443

```

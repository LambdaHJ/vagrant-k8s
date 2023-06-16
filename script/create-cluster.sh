LOCAL_IP=$(hostname -I | cut -d' ' -f1)
API_SERVER_PUBLIC_IP=${public_ip:-$LOCAL_IP}
API_SERVER_LOCAL_IP=${local_ip:-$LOCAL_IP}
filename="$(dirname "$0")/init_config.tpl"
eval "echo \"$(cat "${filename}")\" > gen_config.yaml"
kubeadm init --config ./gen_config.yaml

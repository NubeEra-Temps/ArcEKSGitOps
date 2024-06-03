# Install kubectl
install_kubectl() {
  if ! command -v kubectl &> /dev/null; then
    echo "Installing kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  fi
}

# Install jq
install_jq() {
  if ! command -v jq &> /dev/null; then
    echo "Installing jq..."
    sudo apt-get install -y jq
  fi
}
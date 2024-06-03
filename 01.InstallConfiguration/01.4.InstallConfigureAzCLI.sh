# Install Azure CLI
install_azure_cli() {
  if ! command -v az &> /dev/null; then
    echo "Installing Azure CLI..."
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
  fi
}

# Configure Azure CLI
configure_azure_cli(){
	echo "Configuring Azure CLI..."
	# az login
	# AZURE_SUBSCRIPTION=$(az account show --query id --output tsv)
	# az account set --subscription $AZURE_SUBSCRIPTION
	# az login --use-device-code
}
# Install Azure CLI
install_azure_cli_Linux(){
	echo "Installing Azure CLI..."
    if [ -f /etc/os-release ]; then
      . /etc/os-release
      case $ID in
	  	debian)
			curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
		  ;;
        amzn|fedora)
			echo -e "[azure-cli]
			name=Azure CLI
			baseurl=https://packages.microsoft.com/yumrepos/azure-cli
			enabled=1
			gpgcheck=1
			gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
			sudo dnf install azure-cli
          ;;
		
        *)
          echo "Unsupported distribution for Azure CLI installation"
          exit 1
          ;;
      esac
    else
      echo "Unsupported distribution for Azure CLI installation"
      exit 1
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
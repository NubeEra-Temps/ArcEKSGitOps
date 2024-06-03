# Install AWS CLI
install_aws_cli() {
  if ! command -v aws &> /dev/null; then
    echo "Installing AWS CLI..."
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	sudo apt install unzip -y
	unzip awscliv2.zip
	sudo ./aws/install
    sudo apt-get update
  fi
}

# Configure AWS CLI
configure_aws_cli() {
  echo "Configuring AWS CLI..."
  aws --profile default configure set aws_access_key_id $AWS_AK
  aws --profile default configure set aws_secret_access_key $AWS_SAK
  aws --profile default configure set region $AWS_REGION
  aws --profile default configure set output $AWS_FORMAT 
}
# Configure kubectl
aws eks update-kubeconfig \
    --name $AWS_EKS_CLUSTER_NAME \
    --region $AWS_REGION

# Verify Kubectl configure
kubectl get nodes

# Should run az login
az group create \
    --name $AZ_RG_NAME  \
    --location $AZ_LOCATION

#Finding Correlation ID --> EKS Cluster
az monitor activity-log list \
    --resource-group $AZ_RG_NAME \
    --max-events 5 | grep correlationId


Correlation="10fb3930-31d2-4cf6-bf65-543e90bb98ba"

az connectedk8s connect \
    --name "Arc-EKS-Demo" \
    --resource-group $AZ_RG_NAME \
    --location $AZ_LOCATION \
    --tags "Project=poc-arc-eks" \
    --correlation-id $Correlation

# Verify Connected or not
az connectedk8s list \
    --resource-group $AZ_RG_NAME \
    --output table


kubectl get deployments,pods -n azure-arc

az connectedk8s delete \
    -n "Arc-EKS-Demo" \
    -g  $AZ_RG_NAME \
    --force

# 1.Install Azure Arc Extension
# az k8s-extension create \
#     --name ArcExtensionData \
#     --cluster-name $AZ_ARC_CLUSTER_NAME \
#     --resource-group $AZ_RG_NAME \
#     --cluster-type connectedClusters \
#     --extension-type Microsoft.AzureArcData

az k8s-extension create \
  --name ArcExtensionFlux \
  --extension-type microsoft.flux \
  --cluster-type connectedClusters \
  --cluster-name "Arc-EKS-Demo" \
  --resource-group "rgnaresh1135" \
  --scope cluster \
  --auto-upgrade-minor-version true
 
 
AZ_ARC_CLUSTER_NAME=Arc-EKS-Demo
az k8s-extension create \
  --name ArcExtensionFlux \
  --extension-type microsoft.flux \
  --cluster-type connectedClusters \
  --cluster-name $AZ_ARC_CLUSTER_NAME \
  --resource-group $AZ_RG_NAME \
  --scope cluster \
  --auto-upgrade-minor-version true


az k8s-extension create \
  --name ArcExtensionFlux \
  --extension-type microsoft.flux \
  --cluster-type connectedClusters \
  --cluster-name $AZ_ARC_CLUSTER_NAME \
  --resource-group $AZ_RG_NAME \
  --scope cluster \
  --auto-upgrade-minor-version true


# SpringBoot-H2-Logging --> Arc --> EKS
# 3. Configure Azure Arc Flux Extension
az k8s-configuration Flux create \
  --name arc-gitops-demo \
  --cluster-name $AZ_ARC_CLUSTER_NAME \
  --resource-group $AZ_RG_NAME \
  --cluster-type connectedClusters \
  --namespace default \
  --kind git \
  --url https://github.com/NubeEra-MCO/SpringBoot-H2-LoginReg \
  --scope cluster \
  --branch br-k8s \
  --kustomization name=default path=./manifests prune=true

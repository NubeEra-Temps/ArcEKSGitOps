cat > trust-policy.json <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
	  {
		  "Effect": "Allow",
		  "Principal": {
			  "Service": "eks.amazonaws.com"
		  },
		  "Action": "sts:AssumeRole"
	  }
  ]
}
EOF

aws iam create-role \
    --role-name $AWS_EKS_CLUSTER_ROLE_NAME \
    --assume-role-policy-document file://trust-policy.json


aws iam attach-role-policy \
    --role-name $AWS_EKS_CLUSTER_ROLE_NAME \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy

aws eks create-cluster \
  --name $AWS_EKS_CLUSTER_NAME \
  --region $AWS_REGION \
  --kubernetes-version 1.29 \
  --role-arn arn:aws:iam::$AWS_ACCOUNT_ID:role/$AWS_EKS_CLUSTER_ROLE_NAME \
  --resources-vpc-config subnetIds=$AWS_SUBNET_A,$AWS_SUBNET_B,$AWS_SUBNET_C

aws eks wait cluster-active \
  --name $AWS_EKS_CLUSTER_NAME

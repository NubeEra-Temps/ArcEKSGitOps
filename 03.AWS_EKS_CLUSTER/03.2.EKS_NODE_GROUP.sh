cat > node-trust-policy.json <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
	  {
		  "Effect": "Allow",
		  "Principal": {
			  "Service": "ec2.amazonaws.com"
		  },
		  "Action": "sts:AssumeRole"
	  }
  ]
}
EOF

aws iam create-role \
    --role-name $AWS_EKS_NODEGROUP_ROLE_NAME \
    --assume-role-policy-document file://node-trust-policy.json


aws iam attach-role-policy \
    --role-name $AWS_EKS_NODEGROUP_ROLE_NAME \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
aws iam attach-role-policy \
    --role-name $AWS_EKS_NODEGROUP_ROLE_NAME \
    --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly
aws iam attach-role-policy \
    --role-name $AWS_EKS_NODEGROUP_ROLE_NAME \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy


# Creating Node Group Cluster
 aws eks create-nodegroup \
  --cluster-name $AWS_EKS_CLUSTER_NAME \
  --nodegroup-name $AWS_EKS_NODE_GROUP_NAME \
  --node-role arn:aws:iam::$AWS_ACCOUNT_ID:role/$AWS_EKS_NODEGROUP_ROLE_NAME \
  --subnets $AWS_SUBNET_A $AWS_SUBNET_B \
  --scaling-config minSize=1,maxSize=3,desiredSize=2 \
  --ami-type AL2_x86_64 \
  --instance-types $AWS_EKS_NODE_GROUP_INSTANCE_TYPE


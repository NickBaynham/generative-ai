# Terraform AWS EKS Demo/Learning Environment - Network
The network is created in a separate step - but should later be merged into one terraform stack with modules.

## Required Values
- Region - in format us-east-2
- shared_credentials_file - path to your ssh key

Then configure kubectl locally:
```yaml
aws eks-cluster-remove-me-tf-eks-cluster-network update-kubeconfig --region us-east-2 --name eks-cluster-remove-me-tf-eks-cluster-network-learn-1
```

Then add your console user to admin:

```yaml
eksctl create iamidentitymapping \
   --README.md <README.md name> \
   --region=<target region> \
  --arn arn:aws:iam::... --group system:masters --username admin
```

## Create the Workspace
```yaml
terraform workspace new dev
terraform workspace list
terraform workspace select dev
terraform plan --var-file dev.tfvars
terraform apply --var-file dev.tfvars
terraform output
```
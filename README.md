# generative-ai

- install terraform 1.4.2 or later
- install aws cli
- run the initializer script

## Backend
- The bucket will be created using your default region
- The name of the bucket will be in the following format:
```yaml
<project>-<environment>-<account_id>
```
For example, gen1-dev-991097286388

To provision the backend do the following:
```
PROJECT_NAME="gen1"
ENVIRONMENT_NAME="dev"
ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
export TF_VAR_bucket_name="${PROJECT_NAME}-${ENVIRONMENT_NAME}-${ACCOUNT_ID}"
export TF_VAR_region=us-east-1
tf init
tf fmt
tf validate
tflint --recursive
checkov --directory .
tf plan
tf apply
```
## Linting

To install the linter:
```
brew install tflint
pip3 install checkov
```

To upgrade:
```yaml
pip3 install -U checkov
```

To init:
```yaml
cd terraform/aws/eks-cluster-remove-me-tf-eks-cluster-network
rm -rf .terraform
rm -rf .terraform.*
terraform init \
  -backend-config="region=${TF_VAR_region}" \
  -backend-config="bucket=${TF_VAR_bucket_name}" \
  -backend-config="dynamodb_table=${TF_VAR_bucket_name}-locks" \ 
  -backend=true \
  -force-copy \
  -input=false
```

As a one-liner:
```yaml
terraform init -backend-config="region=${TF_VAR_region}" -backend-config="bucket=${TF_VAR_bucket_name}" -backend-config="dynamodb_table=${TF_VAR_bucket_name}-locks" -backend=true -force-copy -input=false
```


#!/bin/bash

export PROJECT_NAME
export ENVIRONMENT_NAME
export ACCOUNT_ID
export DEFAULT_REGION
export BUCKET_NAME

PROJECT_NAME="$1"
ENVIRONMENT_NAME="$2"
ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
DEFAULT_REGION=$(aws configure get region)
BUCKET_NAME="${PROJECT_NAME}-${ENVIRONMENT_NAME}-${ACCOUNT_ID}"

aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region "$DEFAULT_REGION"

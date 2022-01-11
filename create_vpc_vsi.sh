#!/bin/bash

# **************** Global variables *******************
export IC_API_KEY="********"
export TF_LOG=debug
export REGION="eu-de"
export SSH_KEY_PUBLIC='********'
export SSH_KEY_NAME_VPC='ssh-testing1'
export GROUP="Default"

# **************** logon with IBM Cloud CLI **************** 

echo "*********************************"
echo " Logon with IBM Cloud CLI "
ibmcloud login --apikey $IC_API_KEY
ibmcloud target -r $REGION
ibmcloud target -g $GROUP
ibmcloud plugin install vpc-infrastructure
ibmcloud is target --gen 2

ibmcloud is key-create $SSH_KEY_NAME_VPC $SSH_KEY_PUBLIC  --resource-group-name $GROUP
ibmcloud is keys

# **************** init **************** 

echo "*********************************"
echo "Initialize Terraform on IBM Cloud"
terraform init

# **************** plan **************** 

echo "*********************************"
echo "Generate a Terraform on IBM Cloud execution plan"
terraform plan

# **************** apply *************** 

echo "*********************************"
echo "Apply a the Terraform on IBM Cloud execution plan"
terraform apply

echo "*********************************"
echo "Verify the setup with the IBM Cloud CLI"

ibmcloud is vpcs
ibmcloud is subnets
ibmcloud is security-groups
ibmcloud is floating-ips
ibmcloud is keys

# **************** destroy ************* 
echo "*********************************"
echo "Remove VPC infrastructure resources"
terraform destroy

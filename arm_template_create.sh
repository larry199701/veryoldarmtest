#!/usr/bin/env sh

alias az='az.cmd'

RESOURCEGROUP="myResourceGroup"
LOCATION="eastus"

echo "Creating resource group ......"
az group create --name $RESOURCEGROUP --location  $LOCATION
az group list --output table
az account show

echo "Creating storage account ......"
<< 'COMMENT'
# 1. No params & varibles
#templateFile="/c/backup/larry_repos/myscripts/az/arm_template/azuredeploy1.json"
#echo $templateFile
#az deployment group create --resource-group $RESOURCEGROUP --template-file $templateFile --verbose

# 2. Params
templateFile="/c/backup/larry_repos/myscripts/az/arm_template/azuredeploy2.json"
echo $templateFile
parms="storageAccount=larrystorage5 accountType=Standard_LRS"
az deployment group create --resource-group $RESOURCEGROUP --parameters $parms --template-file $templateFile --verbose
#az deployment group validate --resource-group $RESOURCEGROUP --parameters $parms --template-file $templateFile --verbose
az storage account list --resource-group $RESOURCEGROUP --output table
COMMENT

# 3. Variables
templateFile="/c/backup/larry_repos/myscripts/az/arm_template/azuredeploy3.json"
echo $templateFile
parms="storageAccountPrefix=larrystg accountType=Standard_LRS"
az deployment group create --resource-group $RESOURCEGROUP --parameters $parms --template-file $templateFile --verbose
az storage account list --resource-group $RESOURCEGROUP --output table




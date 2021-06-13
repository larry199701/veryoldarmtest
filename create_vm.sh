#!/usr/bin/env sh

alias az='az.cmd'

az group create --name TutorialResources --location eastus
az group list --output table


az vm create --resource-group TutorialResources \
  --name TutorialVM1 \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --output json \
  --verbose 
az vm list

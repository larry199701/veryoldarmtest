#!/usr/bin/env sh

alias az='az.cmd'


echo "deleting resource group"
az group delete --name myResourceGroup --yes
az group list --output table

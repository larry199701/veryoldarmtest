#!/usr/bin/env sh

alias az='az.cmd'


az vm delete -g NetworkWatcherRG  \
    -n TutorialVM1 --yes
az vm list

az group delete --name NetworkWatcherRG --yes
az group list --output table


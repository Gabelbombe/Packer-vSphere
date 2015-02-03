#!/bin/bash
begin=$(date +"%s")

echo >| /tmp/run.log && PACKER_LOG=1 packer build \
  -only=vmware-iso \
  -var="username=${PACKER_USERNAME}" \
  -var="password=${PACKER_PASSWORD}" \
vsphere-oel66.json 2>&1 |tee /tmp/run.log 

termin=$(date +"%s")
difftimelps=$(($termin-$begin))

echo "$(($difftimelps / 60)) minutes and $(($difftimelps % 60)) seconds elapsed for Script Execution."

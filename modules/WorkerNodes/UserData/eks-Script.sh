#!/bin/bash
/etc/eks/bootstrap.sh ${cluster_name} \
  --apiserver-endpoint '${cluster_endpoint}' \
  --kubelet-extra-args '--node-labels=app=my-app,eks.amazonaws.com/capacityType=${capacity_type}'
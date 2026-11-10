#!/bin/bash
#https://github.com/kubernetes-csi/csi-driver-nfs/blob/master/docs/install-csi-driver-v4.4.0.md
curl -skSL https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/v4.4.0/deploy/install-driver.sh | bash -s v4.4.0 --

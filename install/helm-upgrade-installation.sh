#!/bin/sh

set +x -e

source ./env.sh

GLOO_GATEWAY_HELM_VALUES_FILE=gloo-gateway-single.yaml

echo "Gloo Version: $GLOO_VERSION"
echo "Gloo Gateway Values File: $GLOO_GATEWAY_HELM_VALUES_FILE"

helm upgrade gloo-platform gloo-platform/gloo-platform \
   --namespace gloo-mesh \
   --version $GLOO_VERSION \
   --values $GLOO_GATEWAY_HELM_VALUES_FILE \
   --set common.cluster=$CLUSTER_NAME \
   --set licensing.glooGatewayLicenseKey=$GLOO_GATEWAY_LICENSE_KEY
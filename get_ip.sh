#!/bin/bash
EXTERNAL_IP=$(kubectl get service -n laravelio laravelio-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
sed -i "s/app_ip:.*/app_ip: ${EXTERNAL_IP}/" inventory/gcp.yml

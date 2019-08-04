#!/bin/bash
#
# Name: runApp.sh
# Version: 1.0
# Description: Prepare and run a basic application on Kubernetes
#       1. Build a docker image after inject the application files
#       2. Create necessary resouruces to run the application
#       3. Deploy the application
#       4. Show a output with informations to access
#

dockerbin=$(whereis -b docker |awk '{print $2}')

 if !( test -x $dockerbin )
 then
  echo "Docker executable not found"
  exit 1
 fi

echo "1. Building docker image"
docker build -t queroedu/app:v1.0 ./app/.

echo "2. Deploying haproxy ingress"
kubectl apply -f https://raw.githubusercontent.com/haproxytech/kubernetes-ingress/master/deploy/haproxy-ingress.yaml

echo "3. Creating application resources"
kubectl create -f queroedu-app.yaml

hostIp=$(kubectl get nodes -o=jsonpath='{.items[0].status.addresses[0].address}')
ingressPort=$(kubectl get svc -n haproxy-controller haproxy-ingress -o=jsonpath='{.spec.ports[0].nodePort}')

printf "4. Application available at: http://%s:%i\n" $hostIp $ingressPort

kubectl delete deployment git-server-deployment
kubectl delete svc git-server-service

docker build -t git-server .

#kubectl create -f minikube/nfs-pvc1.yaml
kubectl create -f minikube/service.yaml
kubectl create -f minikube/deployment.yaml


kubectl get service

echo "Done!"

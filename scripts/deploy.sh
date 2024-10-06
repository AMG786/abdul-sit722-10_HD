#
# Deploys the Node.js microservice to Kubernetes.
#

set -u # or set -o nounset
: "$AZURE_RG"
: "$AZURE_AKS"

# Fix permissions on the kubeconfig file
chmod 600 /home/runner/.kube/config

az aks get-credentials --resource-group $AZURE_RG --name $AZURE_AKS --overwrite-existing

envsubst < ./scripts/kubernetes/deployment.yaml | kubectl apply -f - 

echo "Deployment. Rolling back."
#kubectl set image deployment/book-catalog-deployment book-catalog-service=abdulmueez822so.azurecr.io/book-catalog:$VERSION
#kubectl rollout status deployment/book-catalog-deployment

# Wait for the deployment to finish
#kubectl rollout status deployment/book-catalog-deployment || {
#    echo "Deployment failed. Rolling back."
#    kubectl rollout undo deployment/book-catalog-deployment
#    exit 1
#}

kubectl get pods
kubectl get deployments
kubectl get services

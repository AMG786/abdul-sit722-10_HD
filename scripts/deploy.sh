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

echo "Deployment failed. Rolling back. start "
# Wait for the deployment to finish
# Wait for the deployment to finish with a timeout
TIMEOUT=300  # Set a timeout in seconds
if ! kubectl rollout status deployment/book-catalog-deployment --timeout=${TIMEOUT}s; then
    echo "Deployment failed. Rolling back."
    kubectl rollout undo deployment/book-catalog-deployment
    exit 1
fi

echo "Deployment failed. Rolling back. end "
kubectl get pods
kubectl get deployments
kubectl get services

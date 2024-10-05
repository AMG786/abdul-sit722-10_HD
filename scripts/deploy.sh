#
# Deploys the Node.js microservice to Kubernetes.
#

set -u # or set -o nounset
: "$AZURE_RG"
: "$AZURE_AKS"

# Fix permissions on the kubeconfig file
chmod 600 /home/runner/.kube/config

az aks get-credentials --resource-group $AZURE_RG --name $AZURE_AKS --overwrite-existing

# Set the namespace (change as necessary)
NAMESPACE="default"  # e.g., "default" or your specific namespace

# Set the deployment name (assumes there's only one deployment in the namespace)
DEPLOYMENT_NAME=$(kubectl get deployments -n $NAMESPACE -o jsonpath='{.items[0].metadata.name}')

#envsubst < ./scripts/kubernetes/deployment.yaml | kubectl apply -f - 
# Deploy the application
# Using envsubst to replace variables in the deployment.yaml file
# Deploy the application
# Using envsubst to replace variables in the deployment.yaml file
if envsubst < ./scripts/kubernetes/deployment.yaml | kubectl apply -f -; then
    echo "Deployment applied successfully."

    # Check the deployment status
    if kubectl rollout status deployment/$DEPLOYMENT_NAME -n $NAMESPACE; then
        echo "Deployment succeeded."
    else
        echo "Deployment failed. Rolling back to the previous version."
        kubectl rollout undo deployment/$DEPLOYMENT_NAME -n $NAMESPACE
        exit 1
    fi
else
    echo "Failed to apply the deployment."
    exit 1
fi

# Display the current state of pods, deployments, and services
kubectl get pods -n $NAMESPACE
kubectl get deployments -n $NAMESPACE
kubectl get services -n $NAMESPACE

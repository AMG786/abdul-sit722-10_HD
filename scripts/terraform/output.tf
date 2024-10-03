output "kubeconfig" {
  value       = azurerm_kubernetes_cluster.cluster.kube_admin_config[0]
  description = "The kubeconfig file for the AKS cluster."
}

output "container_registry" {
  value       = azurerm_container_registry.container_registry.login_server
  description = "The URL of the Azure Container Registry."
}

output "registry_username" {
  value       = azurerm_container_registry.container_registry.admin_username
  sensitive   = true
  description = "The username for the Azure Container Registry."
}

output "registry_password" {
  value       = azurerm_container_registry.container_registry.admin_password
  sensitive   = true
  description = "The password for the Azure Container Registry."
}

output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.cluster.name
  sensitive   = true
  description = "The name of the Azure Kubernetes Service cluster."
}

output "resource_group_name" {
  value       = azurerm_resource_group.bmdksub1.name
  sensitive   = true
  description = "The name of the resource group."
}

output "location" {
  value       = azurerm_resource_group.bmdksub1.location
  sensitive   = true
  description = "The Azure region where the resources are deployed."
}
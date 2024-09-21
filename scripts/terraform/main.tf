provider "azurerm" {
  features {}

  # Remove explicit authentication variables to use Azure CLI session
  subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  # tenant_id       = var.tenant_id
}

# Creates a resource group for our two services in Azure account.
resource "azurerm_resource_group" "bmdkamgfinal786" {
  name     = var.app_name
  location = var.location
}

# Creates a managed Kubernetes cluster on Azuree.
resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.app_name
  location            = var.location
  resource_group_name = azurerm_resource_group.bmdkamgfinal786.name
  dns_prefix          = var.app_name
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }
}

# Creates a container registry on Azure so that we can publish Docker images.
resource "azurerm_container_registry" "container_registry" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.bmdkamgfinal786.name
  location            = var.location
  admin_enabled       = true
  sku                 = "Basic"
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Hardcoded application namee
locals {
  app_name = "bmdksub6"  # Replace with your desired app name
}

# Creates a resource group for our services in Azure account.
resource "azurerm_resource_group" "bmdksub6" {
  name     = local.app_name
  location = var.location
}

# Creates a managed Kubernetes cluster on Azure.
resource "azurerm_kubernetes_cluster" "cluster" {
  name                = local.app_name
  location            = var.location
  resource_group_name = azurerm_resource_group.bmdksub6.name
  dns_prefix          = local.app_name
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

# Creates a container registry on Azure so that we can publish Docker imagess.
resource "azurerm_container_registry" "container_registry" {
  name                = local.app_name
  resource_group_name = azurerm_resource_group.bmdksub6.name
  location            = var.location
  admin_enabled       = true
  sku                 = "Basic"
}
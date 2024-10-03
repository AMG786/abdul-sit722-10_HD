provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "bmdkamgfinal7869" {
  name     = var.app_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.app_name
  location            = var.location
  resource_group_name = azurerm_resource_group.bmdkamgfinal7869.name
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

resource "azurerm_container_registry" "container_registry" {
  name                = var.app_name
  resource_group_name = azurerm_resource_group.bmdkamgfinal7869.name
  location            = var.location
  admin_enabled       = true
  sku                 = "Basic"
}

output "resource_group_name" {
  value = azurerm_resource_group.bmdkamgfinal7869.name
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.cluster.name
}
variable "subscription_id" {
  type        = string
  description = "The subscription ID for the Azure account"
  # Not used since we're using Azure CLI authentication
}

variable "client_id" {
  type        = string
  description = "The client ID of the Azure service principal"
  # Not used since we're using Azure CLI authentication
}

variable "client_secret" {
  type        = string
  description = "The client secret of the Azure service principal"
  sensitive   = true
  # Not used since we're using Azure CLI authentication
}

variable "tenant_id" {
  type        = string
  description = "The tenant ID for the Azure account"
  # Not used since we're using Azure CLI authentication
}

variable "app_name" {
  description = "The name of the application"
}

variable "location" {
  default = "australiasoutheast"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use"
}
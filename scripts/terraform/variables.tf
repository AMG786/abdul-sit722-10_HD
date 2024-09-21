variable "app_name" {
  description = "The name of the application"
}

variable "location" {
  default = "australiasoutheast"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use"
}

variable "subscription_id" {
  description = "Azure subscription ID"
}
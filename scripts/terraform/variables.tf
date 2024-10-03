variable "app_name" {
  description = "The name of the application"
}

variable "location" {
  default = "australiasoutheast"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use"
  default     = "1.30.3"
}

variable "subscription_id" {
  description = "Azure subscription ID"
}
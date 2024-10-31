variable "region" {
  description = "Azure region for resources"
  type        = string
  default     = "uksouth"
}

variable "company" {
  description = "Company name for naming convention"
  type        = string
  default     = "levvr"
}

variable "environment" {
  description = "Deployment environment (dev, qa, prod)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "api_private_key" {
  description = "Private key for accessing the 3rd party API"
  type        = string
  sensitive   = true
}

# General Vars

variable "app_name" {
  description = "The application name"
  default     = "boldbi"
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  default     = "dev"
  type        = string
}

variable "azure_sub_id" {
  description = "Enter Your Azure Subscription ID **required**"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "azure_client_id" {
  description = "Enter Your Azure Client ID **required**"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "azure_client_secret" {
  description = "Enter Your Azure Client Secret **required**"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "azure_tenant_id" {
  description = "Enter Your Azure Tenant ID **required**"
  type        = string
  nullable    = false
  sensitive   = true
}

variable "location" {
  type        = string
  description = "Azure region for resources"
  default     = "eastus"
}

########################################################################################
# Virtual Network
variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
  default     = ["10.1.0.0/16"]
}

########################################################################################
# AKS Subnet

variable "aks_subnet_prefix" {
  type        = list(string)
  description = "Address prefix for the AKS subnet"
}

########################################################################################
# AKS Cluster

variable "aks_node_count" {
  type        = number
  default     = 2
}

variable "aks_vm_size" {
  type        = string
  default     = "Standard_D2_v2"
}

variable "aks_os_disk_size" {
  type        = number
  default     = 30
}

########################################################################################
# PostgreSQL Subnet


variable "postgres_subnet_prefix" {
  type        = list(string)
  description = "Address prefix for the PostgreSQL subnet"
}

########################################################################################
# PostgreSQL Database

variable "postgres_version" {
  type        = string
  default     = "14"
}

variable "db_username" {
  type        = string
  nullable    = false
  sensitive   = true
  description = "Enter Your PostgreSQL username  **required**"
}

variable "db_password" {
  type        = string
  nullable    = false
  sensitive   = true
  description = "Enter Your PostgreSQL password **required**"
}

variable "postgres_storage_gb" {
  type        = number
  default     = 32
}

variable "postgres_sku" {
  type        = string
  default     = "GP_Standard_D4s_v3"
}

variable "postgres_backup_days" {
  type        = number
  default     = 7
}

########################################################################################

variable "storage_subnet_prefix" {
  type        = list(string)
  description = "Address prefix for the Storage subnet"
}

########################################################################################
# Bold BI Deployment
variable "boldbi_namespace" {
  type        = string
  description = "Bold BI namespace"
}

variable "boldbi_version" {
  type        = string
  description = "Bold BI Version"
}

variable "app_base_url" {
  type        = string
  description = "The base URL for the Bold BI application (e.g., https://example.com).If left empty, Azure DNS with randomly generated characters will be used for application hosting(e.g., http://abcd.eastus2.cloudapp.azure.com)."
}

variable "boldbi_unlock_key" {
  description = "Enter Your Bold services unlock key **required for auto-deployment**"
  type        = string 
  sensitive   = true
}

variable "boldbi_email" {
  description = "The Bold BI username **required for auto-deployment**"
  type        = string
  sensitive   = true
}

variable "boldbi_password" {
  description = "The Bold BI user password **required for auto-deployment**"
  type        = string
  sensitive   = true
}

variable "tls_certificate_path" {
  description = "The path to the TLS certificate file"
  type        = string
  default     = ""
}

variable "tls_key_path" {
  description = "The path to the TLS private key file"
  type        = string
  default     = ""
}

# Cloudflare provider
variable "cloudflare_zone_id" {
  description = "Enter cloudflare zone id"
  type        = string
  default     = ""
  sensitive   = true
}

variable "cloudflare_api_token" {
  description = "Enter cloudflare api token"
  type        = string
  default     = "dummytokenplaceholdedummytokenplaceholde"
  sensitive   = true
}

variable "boldbi_secret_vault_name" {
  description = "Enter bold bi secret vault name"
  type        = string
  default     = ""
}

variable "boldbi_secret_vault_rg_name" {
  description = "Enter bold bi secret vault Resource group name"
  type        = string
  default     = ""
}

variable "azure_domain_sub_id" {
  description = "Enter your Domain Subscription ID"
  type        = string
  default     = ""
}

variable "azure_domain_name" {
  description = "Enter your Domain Name"
  type        = string
  default     = ""
}

variable "azure_domain_rg_name" {
  description = "Enter your Domain Resource group name"
  type        = string
  default     = ""
}
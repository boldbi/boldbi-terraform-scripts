# General Vars
variable "region" {
  description = "The AWS region"
  default     = "us-east-1"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR for the Kubernetes cluster"
  type        = string
  default     = "10.0.0.0/16"
}

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

variable "instance_class" {
  description = "Instance class for RDS or EC2"
  type        = string
  default     = "db.t3.micro"
}

variable "node_instance_type" {

  description = "Instance type for EKS nodes"
  type = string
  default = "t3.xlarge"
}
variable "nginx_ingress_version" {
  description = "Nginx ingress version"
  type = string
  default = "1.12.0"
}

# Bold BI Application Variables

variable "bold_bi_namespace" {
  description = "Bold BI deployment namespace"
  type = string
  default = "bold-services"
}

variable "bold_bi_version" {
  type        = string
  description = "Bold BI Version"
}

variable "app_base_url" {
  description = "The base URL for the Bold BI application (e.g., https://example.com). If left empty, the script will use the ALB load balancer DNS for application hosting."
  type        = string
}

variable "install_optional_libs" {
  description = "Comma-separated list of optional libraries for Bold BI"
  default     = "mongodb,mysql,influxdb,snowflake,oracle,clickhouse,google"
  type        = string
}

variable "db_username" {
  description = "The PostgreSQL username"
  type        = string
  nullable    = false
}

variable "db_password" {
  description = "The PostgreSQL password"
  type        = string
  sensitive   = true
  nullable    = false
}

variable "boldbi_unlock_key" {
  description = "The Bold services unlock key"
  type        = string
  sensitive   = true
  nullable    = false
}

variable "boldbi_email" {
  description = "The Bold BI admin username"
  type        = string
  nullable    = false
}

variable "boldbi_password" {
  description = "The Bold BI admin password"
  type        = string
  sensitive   = true
  nullable    = false
}

# Startup Configuration Secrets
variable "boldbi_secret_arn" {
  description = "The ARN of the Secrets Manager secret for Bold BI configuration"
  type        = string
  default     = "" # Forces user to provide a value
}

# Route 53 Configuration
variable "route53_zone_id" {
  description = "The Route 53 hosted zone ID. If left empty, Bold BI will not be configured with a custom domain."
  type        = string
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

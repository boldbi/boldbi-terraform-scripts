# How to Deploy Bold BI in AWS ECS with a Single Execution Using Terraform

This guide explains how to deploy Bold BI on AWS ECS using Terraform scripts in a single command execution. Follow the steps carefully to ensure a successful deployment.

---

## Prerequisites

Before proceeding, ensure the following tools and resources are installed and available:

1. **Terraform CLI**  
   Install Terraform from the official guide: [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. **AWS Account with Required Privileges**  
   Ensure your AWS account has the necessary permissions defined in the `policy.json` file.

---

## Overview of the Script

The Terraform script performs the following actions:
- Creates necessary network resources such as **VPC**, **subnets**, **Internet Gateway**, and **route tables**.
- Deploys an **ECS cluster** with EC2 instances.
- Configures an **Application Load Balancer (ALB)** to access the services.
- Provisions a **PostgreSQL RDS** instance for Bold BI's application configuration.

---

## Deployment Steps

### Step 1: Download and Prepare the Script

1. Clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the Terraform scripts directory:
   ```bash
   cd terraform-scripts/aws-ecs
   ```

---

### Step 2: Update Variable Files

1. Open the `terraform.tfvars` file.
2. Update the required details in the file.

---

### Step 3: Setting Up Sensitive Variables

The following variables are considered sensitive. There are two ways to pass these values securely:

| Variable Name            | Description                                        |
|--------------------------|----------------------------------------------------|
| AWS_ACCESS_KEY_ID       | AWS access key for authentication                 |
| AWS_SECRET_ACCESS_KEY   | AWS secret key for authentication                 |
| TF_VAR_db_username      | Database username                                 |
| TF_VAR_db_password      | Database password                                 |
| TF_VAR_boldbi_username  | Bold BI admin username                            |
| TF_VAR_boldbi_usr_password | Bold BI admin password                        |
| TF_VAR_bold_unlock_key  | Unlock key for Bold BI                            |
| TF_VAR_cloudflare_api_token | Cloudflare API token (if applicable)         |
| TF_VAR_cloudflare_zone_id  | Cloudflare Zone ID (if applicable)            |
| TF_VAR_route53_zone_id  | AWS Route 53 Zone ID (if applicable)              |

#### Option 1: AWS Secrets Manager

1. Store the sensitive variables in AWS Secrets Manager.
2. Update the corresponding Secret ARN in the `terraform.tfvars` file.

#### Option 2: Set Environment Variables (Windows)

Run the following commands in PowerShell:

```powershell
[System.Environment]::SetEnvironmentVariable('TF_VAR_db_username', 'syncfusionuser', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('TF_VAR_db_password', 'synfusion123!', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('TF_VAR_boldbi_username', 'adminuser@boldbi.com', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('TF_VAR_boldbi_usr_password', 'Admin@123', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('TF_VAR_bold_unlock_key', 'your-bold-unlock-key', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('TF_VAR_cloudflare_api_token', 'your-cloudflare-api-token', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('TF_VAR_cloudflare_zone_id', 'your-cloudflare-zone-id', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('TF_VAR_route53_zone_id', 'your-route53-zone-id', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('AWS_ACCESS_KEY_ID', 'your-aws-access-key-id', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('AWS_SECRET_ACCESS_KEY', 'your-aws-secret-access-key', [System.EnvironmentVariableTarget]::User)
```

---

### Step 4: Initialize the Terraform Script

1. Initialize Terraform:
   ```bash
   terraform init
   ```

---

### Step 5: Validate the Terraform Script

1. Validate the Terraform configuration to ensure it has no errors:
   ```bash
   terraform validate
   ```

---

### Step 6: Review the Resource Plan

1. Preview the resources that will be created by running:
   ```bash
   terraform plan
   ```
2. Review the output carefully to confirm the resources and configurations match your requirements.

---

### Step 7: Apply the Script

1. Deploy the resources by running:
   ```bash
   terraform apply
   ```
2. Confirm the execution when prompted by typing `yes`.

---
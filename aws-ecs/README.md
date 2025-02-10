
# How to Deploy Bold BI in AWS ECS with a Single Execution Using Terraform

This guide explains how to deploy Bold BI on AWS ECS using Terraform scripts in a single command execution. Follow the steps carefully to ensure a successful deployment.

---

## Prerequisites

Before proceeding, ensure the following tools and resources are installed and available:

1. **Terraform CLI**  
   Install Terraform from the official guide: [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

2. **AWS CLI**  
   Install and configure AWS CLI by following this guide: [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

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

1. Clone the respoitory 

2. Navigate to /terraform-scripts/aws-ecs path.

---

### Step 2: Update Variable Files

1. Open the `terraform.tfvars` file.
2. Update the required details in the file.
3. Create a secret in AWS Secrets Manager and update it with sensitive information such as the database username, password, Bold BI unlock key, username, and password. Then, update the ARN value of the secret in the `terraform.tfvars` file. or You can pass this as local environment variable in your system. 

### Step 3: Initialize the Terraform Script

1. Initialize Terraform:  
   ```bash
   terraform init
   ```

---

### Step 4: Validate the Terraform Script

1. Validate the Terraform configuration to ensure it has no errors:  
   ```bash
   terraform validate
   ```

---

### Step 5: Review the Resource Plan

1. Preview the resources that will be created by running:  
   ```bash
   terraform plan
   ```

2. Review the output carefully to confirm the resources and configurations match your requirements.

---

### Step 6: Apply the Script

1. Deploy the resources by running:  
   ```bash
   terraform apply
   ```
2. Confirm the execution when prompted by typing `yes`.

---

### Step 7: Troubleshooting ALB Endpoint Issues

If you face issues accessing the Application Load Balancer (ALB) endpoint:
1. Check the health check of the application using the URL below:  
   ```
   http://{loadbalancer-dns}/status
   ```

2. If any of the services show issues, restart the specific ECS services using the following command:  
   ```bash
   aws ecs update-service --cluster <cluster-name> --service <service-name> --force-new-deployment
   ```
   example command: aws ecs update-service --cluster ecs-cluster --service bi-dataservice-service --force-new-deployment
    ![Deployment issue](./images/deployment-issue.png)
3. Verify the application health check after the restart and wait for all services to be up and running.
   ![Health Check](./images/health-check.png)

---

### Step 8: Post-Deployment Configuration

1. Once the deployment is complete, open the ALB endpoint in your browser:  
   ```
   http://{loadbalancer-dns}
   ```
2. The startup configuration will automatically complete.
   ![Deployment success](./images/deployment-success.png)
You are now ready to use Bold BI!

---

## Notes

- Ensure your AWS account has sufficient permissions to create all necessary resources (e.g., VPC, ECS, RDS, etc.).
- Regularly monitor the created resources for cost and performance optimization.
- For any issues, refer to the AWS and Terraform documentation or reach out to the Bold BI support team.

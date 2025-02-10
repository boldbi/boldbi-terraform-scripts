# Provider Configuration
region = "us-east-1"
app_name = "bold"
environment = "dev"

# Bold BI Deployment Configuration
bold_services_hosting_environment = "k8s"
app_base_url                      = "" # Value must be with secure protocol (e.g., https://dashboard.boldbi.com).
                                       # If leaving this empty, the script will take the ALB load balancer DNS for application hosting.
install_optional_libs             = "mongodb,mysql,influxdb,snowflake,oracle,clickhouse,google" # These are the client libraries used in Bold BI by default. Update this as per your requirements.
bold_services_use_site_identifier = "true" # Bold BI requires a site identifier, which differentiates sites on the same domain (e.g., https://example.com/bi/site/). 
                                           # Set this to FALSE if you wish to ignore the site identifier. If disabled, each site requires a unique domain.

id_web_image_tag      = "9.1.73"
id_ums_image_tag      = "9.1.73"
id_api_image_tag      = "9.1.73"
bi_web_image_tag = "9.1.73"
bi_api_image_tag = "9.1.73"
bi_jobs_image_tag = "9.1.73"
bi_dataservice_image_tag = "9.1.73"
bold_etl_image_tag = "9.1.73"

# EC2 Instance and ECS Configuration
launch_type = "EC2" # supported values EC2 and FARGATE
instance_class = "db.t3.micro"  # Instance class for RDS or EC2
instance_type = "t3.xlarge"     # EC2 instance type
task_cpu = 256  # CPU allocation for ECS container
task_memory = 512  # Memory allocation for ECS container (in MiB)
ecs_task_replicas = 1  # Number of ECS task replicas
deployment_maximum_percent = 200  # Maximum percentage of tasks during deployment
deployment_minimum_healthy_percent = 100  # Minimum percentage of healthy tasks during deployment

# SSL Configuration
certificate_arn = ""

# Route 53 Configuration
route53_zone_id = ""  # Add the hosted zone ID if available

# Cloudflare domain mapping
#cloudflare_api_token = ""

#cloudflare_zone_id = "value"

# Secrets and Sensitive Information
#boldbi_secret_arn = ""
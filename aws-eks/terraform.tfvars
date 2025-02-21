# Provider Configuration
region = "us-east-1"
app_name = "bi"
environment = "dev"
vpc_cidr = "10.0.0.0/16"

# These are the default client libraries used in Bold BI. Update as needed.
install_optional_libs = "mongodb,mysql,influxdb,snowflake,oracle,clickhouse,google"  

node_instance_type = "t3.xlarge"

bold_bi_version = "10.1.18"

instance_class = "db.t3.micro"
# AWS secret manager ARN
boldbi_secret_arn = ""
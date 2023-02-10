# Environment specific tags
environment = "Uat"
environment_owner = "uat-testers@mycompany.com.au"

// Network
vpc_cidr     = "10.2.0.0/16"
subnet1_cidr = "10.2.1.0/24"
subnet2_cidr = "10.2.2.0/24"
subnet3_cidr = "10.2.3.0/24"
subnet4_cidr = "10.2.4.0/24"

# EC2
ec2_instance_type = "t3.large"
root_volume_size = 10

# RDS
db_instance_class   = "db.m5.large"
db_name             = "mydatabase"
db_user             = "root"
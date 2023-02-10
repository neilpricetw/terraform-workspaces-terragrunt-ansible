configuration = {
  prod = {
    environment       = "Prod"
    environment_owner = "prod@mycompany.com.au"

    // Network
    vpc_cidr     = "10.3.0.0/16"
    subnet1_cidr = "10.3.1.0/24"
    subnet2_cidr = "10.3.2.0/24"
    subnet3_cidr = "10.3.3.0/24"
    subnet4_cidr = "10.3.4.0/24"

    allowed_ips_to_s3_bucket = ["7.7.7.7", "8.8.8.8"]

    # EC2
    ec2_instance_type = "t3.large"
    root_volume_size  = 10

    # RDS
    db_instance_class = "db.m5.large"
    db_name           = "mydatabase"
    db_user           = "root"
  }
  uat = {
    environment       = "Uat"
    environment_owner = "uat-testers@mycompany.com.au"

    // Network
    vpc_cidr                 = "10.2.0.0/16"
    subnet1_cidr             = "10.2.1.0/24"
    subnet2_cidr             = "10.2.2.0/24"
    subnet3_cidr             = "10.2.3.0/24"
    subnet4_cidr             = "10.2.4.0/24"
    allowed_ips_to_s3_bucket = ["1.1.1.1", "2.2.2.2"]
  }
  test = {
    environment       = "Test"
    environment_owner = "internal-testers@mycompany.com.au"

    // Network
    vpc_cidr     = "10.1.0.0/16"
    subnet1_cidr = "10.1.1.0/24"
    subnet2_cidr = "10.1.2.0/24"
    subnet3_cidr = "10.1.3.0/24"
    subnet4_cidr = "10.1.4.0/24"

    allowed_ips_to_s3_bucket = ["1.1.1.1", "2.2.2.2"]

    # EC2
    ec2_instance_type = "t3.medium"
  }
  dr = {
    environment       = "DR"
    environment_owner = "dr@mycompany.com.au"

    // Network
    vpc_cidr     = "10.0.0.0/16"
    subnet1_cidr = "10.0.1.0/24"
    subnet2_cidr = "10.0.2.0/24"
    subnet3_cidr = "10.0.3.0/24"
    subnet4_cidr = "10.0.4.0/24"
  }
  dev = {
    # Environment specific tags
    environment       = "Dev"
    environment_owner = "internal-testers@mycompany.com.au"

    // Network
    vpc_cidr     = "10.0.0.0/16"
    subnet1_cidr = "10.0.1.0/24"
    subnet2_cidr = "10.0.2.0/24"
    subnet3_cidr = "10.0.3.0/24"
    subnet4_cidr = "10.0.4.0/24"

    allowed_ips_to_s3_bucket = ["1.1.1.1", "2.2.2.2"]

    # EC2
    ec2_instance_type = "t3.medium"
  }
}

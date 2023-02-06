terraform {
  source =
    "../"
}

inputs = {
    environment = "Dev"
    environment_owner = "devs@mycompany.com.au"
    allowed_ips = [ "1.1.1.1", "2.2.2.2" ]

    // Network
    VPC_cidr     = "10.0.0.0/16"     
    subnet1_cidr = "10.0.1.0/24"     
    subnet2_cidr = "10.0.2.0/24"     
    subnet3_cidr = "10.0.3.0/24"  
    subnet4_cidr = "10.0.4.0/24"    
}
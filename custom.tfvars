vpc_cidr           = "10.0.0.0/16"
all_subnets        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["ap-south-1a", "ap-south-1b"]
ingress_ports      = [22, 80, 443, 3306]
allowed_cidrs      = ["0.0.0.0/0"]

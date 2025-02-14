instances_count = [
  {  
    name                        = "my_pub_1"
    ami                         = "ami-12345678"
    instance_type               = "t2.micro"
    subnet_id                   = "subnet-public-1"
    vpc_security_group_ids      = ["sg-12345"]
    # key_name                    = "my-key"
    associate_public_ip_address = true
    private_ip                  = "10.0.1.10"
    security_group_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name                        = "my_priv_1"
    ami                         = "ami-12345678"
    instance_type               = "t2.micro"
    subnet_id                   = "subnet-private-1"
    vpc_security_group_ids      = ["sg-12346"]
    # key_name                    = "my-key"
    associate_public_ip_address = false
    private_ip                  = "10.0.3.1"
    security_group_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.0.0/18"] }
    ]
  },
  {
    name                        = "my_priv_2"
    ami                         = "ami-12345678"
    instance_type               = "t2.micro"
    subnet_id                   = "subnet-private-2"
    vpc_security_group_ids      = ["sg-12346"]
    # key_name                    = "my-key"
    associate_public_ip_address = false
    private_ip                  = "10.0.3.2"
    security_group_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.0.0/18"] }
    ]
  }
]

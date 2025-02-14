variable "instances_count" {
  type = list(object({
    name                        = string
    ami                         = string
    instance_type               = string
    subnet_id                   = string
    vpc_security_group_ids      = list(string)
    # key_name                    = string
    associate_public_ip_address = bool
    private_ip                  = string
    security_group_rules        = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}


# variable "instances_count" {
#   default = [
#     {  
#       name                        = "my_pub_1"
#       ami                         = "ami-12345678"
#       instance_type               = "t2.micro"
#       subnet_id                   = "subnet-public-1"
#       vpc_security_group_ids      = ["sg-12345"]
#       key_name                    = "my-key"
#       associate_public_ip_address = true
#       private_ip                  = "10.0.1.10"
#       security_group_rules = [
#         { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
#         { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
#         { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
#       ]
#     },
#     {
#       name                        = "my_priv_1"
#       ami                         = "ami-12345678"
#       instance_type               = "t2.micro"
#       subnet_id                   = "subnet-private-1"
#       vpc_security_group_ids      = ["sg-12346"]
#       key_name                    = "my-key"
#       associate_public_ip_address = false
#       private_ip                  = "10.0.2.20"
#       security_group_rules = [
#         { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["10.0.0.0/18"] }
#       ]
#     }
#   ]
# }

# variable "instances" {
#   description = "List of instances with their subnet and public IP requirements"
#   type = list(object({
#     name                        = string
#     subnet_id                   = string
#     associate_public_ip_address = bool
#     private_ip                  = string
#     security_group_rules        = list(object({
#       from_port   = number
#       to_port     = number
#       protocol    = string
#       cidr_blocks = list(string)
#     }))
#   }))
# }

variable "vpc_id" {
  description = "VPC ID where EC2 instances and security groups will be created"
  type        = string
}

variable "user_data" {
  description = "The user data to provide when launching the instance. see user_data_base64 instead"
  type        = string
  default     = null
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}
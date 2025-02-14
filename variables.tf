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

############ VPC ##########
variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "final_vpc" {
  description = "It should br true to create vpc"
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "Name for the vpc"
  type = string
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "cidr" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  type        = list(string)
  default     = []
}

variable "ipv4_ipam_pool_id" {
  description = "The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR"
  type        = string
  default     = null
}

variable "ipv4_netmask_length" {
  description = "The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id"
  type        = number
  default     = null
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_network_address_usage_metrics" {
  description = "Determines whether network address usage metrics are enabled for the VPC"
  type        = bool
  default     = null
}
########################### Internet Gateway #############
variable "igw_name" {
    description = "Name of the Internet Gateway"
    type        = string
    default     = "igw"
}

variable "create_igw" {
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them"
  type        = bool
  default     = true
}

variable "igw_tags" {
  description = "Additional tags for the internet gateway"
  type        = map(string)
  default     = {}
}

################ Public Subnet ###############

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidr" {
  description = "IPv4 CIDR block for public subnet"
  type = string
  default = ""
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`"
  type        = bool
  default     = false
}

variable "azs" {
    description = "Availability zone for public subnet"
    type = list(string)
    default = ["us-west-2a", "us-west-2b"]
}

variable "public_subnet_names" {
  description = "Explicit values to use in the Name tag on public subnets. If empty, Name tags are generated"
  type        = string
  default     = ""
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  type        = bool
  default     = false
}

variable "public_subnet_private_dns_hostname_type_on_launch" {
  description = "The type of hostnames to assign to instances in the subnet at launch."
  type        = string
  default     = null
}

variable "public_subnet_tags_per_az" {
  description = "Additional tags for the public subnets where the primary key is the AZ"
  type        = map(map(string))
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public"
}

variable "public_rout_table_name" {
  description = "A map of tags to assign to the resource. If configured with a provider"
  type = string
  default = ""
}

variable "create_multiple_public_route_tables" {
  description = "Indicates whether to create a separate route table for each public subnet. Default: `false`"
  type        = bool
  default     = false
}

variable "public_route_table_tags" {
  description = "Additional tags for the public route tables"
  type        = map(string)
  default     = {}
}

variable "public_subnet_ipv6_native" {
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  type        = bool
  default     = false
}

############################### Private Subnet ###########################

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.0.3.0/24"]
}

variable "private_subnet_cidr" {
  description = "IPv4 CIDR block for private subnet"
  type = string
  default = ""
}

variable "private_subnet_private_dns_hostname_type_on_launch" {
  description = "The type of hostnames to assign to instances in the subnet at launch."
  type        = string
  default     = null
}

variable "private_subnet_names" {
  description = "Explicit values to use in the Name tag on private subnets. If empty, Name tags are generated"
  type        = string
  default     = ""
}

variable "private_rout_table_name" {
  description = "A map of tags to assign to the resource. If configured with a provider"
  type = string
  default = ""
}

variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets name"
  type        = string
  default     = "private"
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}

variable "private_route_table_tags" {
  description = "Additional tags for the private route tables"
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags_per_az" {
  description = "Additional tags for the private subnets where the primary key is the AZ"
  type        = map(map(string))
  default     = {}
}

variable "create_private_nat_gateway_route" {
  description = "Controls if a nat gateway route should be created to give internet access to the private subnets"
  type        = bool
  default     = true
}

variable "private_subnet_ipv6_native" {
  description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
  type        = bool
  default     = false
}

############################## NAT Gateway ####################

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  type        = bool
  default     = false
}

variable "external_nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = list(string)
  default     = []
}

variable "nat_eip_tags" {
  description = "Additional tags for the NAT EIP"
  type        = map(string)
  default     = {}
}

variable "nat_gateway_destination_cidr_block" {
  description = "Used to pass a custom destination route for private NAT Gateway. If not specified, the default 0.0.0.0/0 is used as a destination route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "nat_gateway_tags" {
  description = "Additional tags for the NAT gateways"
  type        = map(string)
  default     = {}
}

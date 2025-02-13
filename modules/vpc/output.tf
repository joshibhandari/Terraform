locals {
  public_route_table_ids   = aws_route_table.public_rt[*].id
  private_route_table_ids  = aws_route_table.private[*].id
}

########################### VPC ######################
output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.main[0].id, null)
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = try(aws_vpc.main[0].arn, null)
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = try(aws_vpc.main[0].cidr_block, null)
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = try(aws_vpc.main[0].enable_dns_support, null)
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = try(aws_vpc.main[0].enable_dns_hostnames, null)
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC"
  value       = try(aws_vpc.main[0].main_route_table_id, null)
}

##################################### Internet Gateway ###########################################


output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = try(aws_internet_gateway.igw[0].id, null)
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = try(aws_internet_gateway.igw[0].arn, null)
}

################################## Publiс Subnets ##############################################

output "public_subnet_objects" {
  description = "A list of all public subnets, containing the full objects."
  value       = aws_subnet.public
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = aws_subnet.public[*].arn
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = compact(aws_subnet.public[*].cidr_block)
}

output "public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = local.public_route_table_ids
}

output "public_internet_gateway_route_id" {
  description = "ID of the internet gateway route"
  value       = try(aws_route.public_internet_gateway[0].id, null)
}

##################################### Private Subnets ###########################################

output "private_subnet_objects" {
  description = "A list of all private subnets, containing the full objects."
  value       = aws_subnet.private
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.private[*].arn
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = compact(aws_subnet.private[*].cidr_block)
}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = local.private_route_table_ids
}

output "private_nat_gateway_route_ids" {
  description = "List of IDs of the private nat gateway route"
  value       = aws_route.private_nat_gateway[*].id
}

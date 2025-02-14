resource "aws_instance" "ec2" {
  count                         = length(var.instances_count)
  ami                           = var.instances_count[count.index].ami
  instance_type                 = var.instances_count[count.index].instance_type
  subnet_id                     = var.instances_count[count.index].subnet_id
  vpc_security_group_ids        = var.instances_count[count.index].vpc_security_group_ids
  # key_name                      = var.instances_count[count.index].key_name
  associate_public_ip_address   = var.instances_count[count.index].associate_public_ip_address
  private_ip                    = var.instances_count[count.index].private_ip

  tags = {
    Name = var.instances_count[count.index].name
  }
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "generated" {
  key_name   = var.key_name
  public_key = tls_private_key.key.public_key_openssh
}

resource "aws_security_group" "sg" {
  for_each = { for idx, instance in var.instances_count : idx => instance }

  name        = "${each.value.name}-sg"
  description = "Security group for ${each.value.name}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = each.value.security_group_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = {
    Name = "${each.value.name}-sg"
  }
}


resource "aws_security_group" "allow_tls" {
  name = "mario-security-group"

  tags = merge(local.common_tags, {
    name = "security_group_name"
  })
  ingress { //como liberar meu proprio IP para acessar o EC2 via interface aws -> ec2 -> instances -> connect??
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.eip.outputs.eip}/32"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port   = 20
    to_port     = 20
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

}



resource "aws_security_group" "allow_tls_dinamically" {
  name = "mario-security-group-dynamic"

  tags = merge(local.common_tags, {
    name = "security_group_name2"
  })

  dynamic "ingress" {
    for_each = var.security_group_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["${data.terraform_remote_state.eip.outputs.eip}/32"]
    }
  }

  dynamic "egress" {
    for_each = var.security_group_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}


/*
resource "aws_security_group" "allow_tls_dinamically_from_to" {
  name = "mario-security-group-dynamic-from-to"

  tags = merge(local.common_tags, {
    name = "security_group_name_from_to"
  })

  dynamic "ingress" {
    for_each = var.security_group_ports_from_to
    iterator = port
    content {
      from_port   = port.key
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.security_group_ports_from_to
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.key
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}*/

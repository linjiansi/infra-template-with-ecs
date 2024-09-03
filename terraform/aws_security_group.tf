resource "aws_security_group" "elb" {
  name   = "${local.project}-elb"
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${local.project}-elb"
  }
}

resource "aws_security_group_rule" "elb_tcp_ingress" {
  count             = length(local.elb_sg_ingress_ports)
  security_group_id = aws_security_group.elb.id
  type              = "ingress"
  from_port         = local.elb_sg_ingress_ports[count.index]
  to_port           = local.elb_sg_ingress_ports[count.index]
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "elb_tcp_egress" {
  security_group_id        = aws_security_group.elb.id
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.app_server.id
}

resource "aws_security_group" "app_server" {
  name   = "${local.project}-app-server"
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${local.project}-app-server"
  }
}

resource "aws_security_group_rule" "app_server_tcp_ingress" {
  security_group_id        = aws_security_group.app_server.id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.elb.id
}

resource "aws_security_group_rule" "app_server_egress" {
  security_group_id = aws_security_group.app_server.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "bastion_server" {
  name   = "${local.project}-bastion-server"
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${local.project}-bastion-server"
  }
}

resource "aws_security_group_rule" "bastion_server_egress" {
  security_group_id = aws_security_group.bastion_server.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "rds" {
  name   = "${local.project}-rds"
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${local.project}-rds"
  }
}

resource "aws_security_group_rule" "rds_tcp_ingress" {
  security_group_id = aws_security_group.rds.id
  type              = "ingress"
  from_port         = local.database_port
  to_port           = local.database_port
  protocol          = "tcp"
  cidr_blocks = [
    aws_subnet.private_subnet_app_server_container_1a.cidr_block,
    aws_subnet.private_subnet_bastion_container_1a.cidr_block,
  ]
}

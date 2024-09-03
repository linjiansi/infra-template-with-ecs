resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    type = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    type = "private"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}

resource "aws_route_table_association" "public_subnet_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_1c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_subnet_app_server_container_1a" {
  subnet_id      = aws_subnet.private_subnet_app_server_container_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_db_1a" {
  subnet_id      = aws_subnet.private_subnet_db_1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_db_1c" {
  subnet_id      = aws_subnet.private_subnet_db_1c.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_bastion_container_1a" {
  subnet_id      = aws_subnet.private_subnet_bastion_container_1a.id
  route_table_id = aws_route_table.private.id
}

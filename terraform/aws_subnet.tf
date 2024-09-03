resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${local.project}-public-1a"
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${local.project}-public-1c"
  }
}

resource "aws_subnet" "private_subnet_app_server_container_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${local.project}-private-app-server-container-1a"
  }
}

resource "aws_subnet" "private_subnet_db_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.30.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${local.project}-private-db-1a"
  }
}

resource "aws_subnet" "private_subnet_db_1c" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.31.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${local.project}-private-db-1c"
  }
}

resource "aws_subnet" "private_subnet_bastion_container_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.50.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${local.project}-private-bastion-container-1a"
  }
}

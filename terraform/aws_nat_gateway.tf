resource "aws_nat_gateway" "this" {
  subnet_id     = aws_subnet.public_subnet_1a.id
  allocation_id = aws_eip.this.id
  depends_on    = [aws_internet_gateway.this]
}

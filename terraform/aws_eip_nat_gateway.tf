resource "aws_eip" "this" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.this]
}

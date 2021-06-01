resource "aws_internet_gateway" "internet_gateway" {
  count  = var.should_be_created ? 1 : 0
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}

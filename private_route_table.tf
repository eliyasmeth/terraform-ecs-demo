resource "aws_route_table" "rt_private_1a" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public_nat_1a.id
  }

  tags = {
    Name = "${var.project_name}-rt-private-1a"
  }
}

resource "aws_route_table" "rt_private_1b" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public_nat_1b.id
  }

  tags = {
    Name = "${var.project_name}-rt-private-1b"
  }
}

resource "aws_route_table_association" "private1_1a" {
  subnet_id      = aws_subnet.private1_1a.id
  route_table_id = aws_route_table.rt_private_1a.id
}

resource "aws_route_table_association" "private2_1a" {
  subnet_id      = aws_subnet.private2_1a.id
  route_table_id = aws_route_table.rt_private_1a.id
}

resource "aws_route_table_association" "private1_1b" {
  subnet_id      = aws_subnet.private1_1b.id
  route_table_id = aws_route_table.rt_private_1b.id
}

resource "aws_route_table_association" "private2_1b" {
  subnet_id      = aws_subnet.private2_1b.id
  route_table_id = aws_route_table.rt_private_1b.id
}
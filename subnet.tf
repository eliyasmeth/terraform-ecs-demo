
resource "aws_subnet" "public_1a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_1a_cidr
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-public_1a"
  }
}

resource "aws_subnet" "private1_1a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private1_1a_cidr
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-private1_1a"
  }
}

resource "aws_subnet" "private2_1a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private2_1a_cidr
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-private2_1a"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.public_1b_cidr
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "${var.project_name}-public_1b"
  }
}

resource "aws_subnet" "private1_1b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private1_1b_cidr
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "${var.project_name}-private1_1b"
  }
}

resource "aws_subnet" "private2_1b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private2_1b_cidr
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "${var.project_name}-private2_1b"
  }
}
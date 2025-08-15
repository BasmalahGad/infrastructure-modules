resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnets_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnets_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name                                           = "${var.project}-private-subnet-${count.index}"
    "kubernetes.io/cluster/${var.project}-cluster" = "owned"
    "kubernetes.io/role/internal-elb"              = "1"
  }
}

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnets_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets_cidrs[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name                                           = "${var.project}-public-subnet-${count.index}"
    "kubernetes.io/cluster/${var.project}-cluster" = "owned"
    "kubernetes.io/role/elb"                       = "1"
  }
}


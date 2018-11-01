# Declare the data source
data "aws_availability_zones" "available" {}

/* EXTERNAL NETWORK, IG, ROUTE TABLE */
resource "aws_internet_gateway" "gw" {
  vpc_id = "${var.MYvpc_id}"
  tags {
    Name = "internet gw MY generated"
	Environment = "${var.MYenvironment}"
  }
}
resource "aws_network_acl" "all" {
  vpc_id = "${var.MYvpc_id}"
  egress {
    protocol = "-1"
    rule_no = 2
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
  ingress {
    protocol = "-1"
    rule_no = 1
    action = "allow"
    cidr_block =  "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
  tags {
    Name = "open acl"
	Environment = "${var.MYenvironment}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${var.MYvpc_id}"
  tags {
    Name = "Public"
	Environment = "${var.MYenvironment}"  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}

resource "aws_route_table" "private" {
  vpc_id = "${var.MYvpc_id}"
  tags {
    Name = "Private"
	Environment = "${var.MYenvironment}"
  }
  route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.PublicAZA.id}"
  }
}

resource "aws_eip" "forNat" {
  vpc      = true
}

resource "aws_route_table_association" "PublicAZA" {
    subnet_id = "${aws_subnet.PublicAZA.id}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "PrivateAZA" {
    subnet_id = "${aws_subnet.PrivateAZA.id}"
    route_table_id = "${aws_route_table.private.id}"
}

resource "aws_nat_gateway" "PublicAZA" {
  allocation_id = "${aws_eip.forNat.id}"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  tags {
        Name = "DEVv2"
  }
}

####################################################
#FROM SUBNETS.TF
#
resource "aws_subnet" "PublicAZA" {
  vpc_id = "${var.MYvpc_id}"
  cidr_block = "${var.MYvpcsubn-pub-cidr}"
  tags {
	Name = "PublicAZA"
	Environment = "${var.MYenvironment}"
  }
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

resource "aws_subnet" "PrivateAZA" {
  vpc_id = "${var.MYvpc_id}"
  cidr_block = "${var.MYvpcsubn-pri-cidr}"
  tags {
    Name = "PublicAZB"
	Environment = "${var.MYenvironment}"
  }
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}



























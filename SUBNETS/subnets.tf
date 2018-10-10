data "aws_availability_zones" "available" {}
#
# relies on VPC module
#
resource "aws_subnet" "PublicAZA" {
  vpc_id = "${var.MYvpc_id}"
  cidr_block = "${var.MYvpcsubn-pub-cidr}"
  tags {
        Name = "PublicAZA"
  }
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

resource "aws_subnet" "PrivateAZA" {
  vpc_id = "${var.MYvpc_id}"
  cidr_block = "${var.MYvpcsubn-pri-cidr}"
  tags {
        Name = "PublicAZB"
  }
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}

#
# relies on ROUTING module
#
resource "aws_route_table_association" "PublicAZA" {
    subnet_id = "${aws_subnet.PublicAZA.id}"
    route_table_id = "${var.MYsubnet_publicAZA_id}"
}
resource "aws_route_table_association" "PrivateAZA" {
    subnet_id = "${aws_subnet.PrivateAZA.id}"
    route_table_id = "${var.MYsubnet_privateAZA_id}"
}
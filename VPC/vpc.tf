
resource "aws_vpc" "DevEc2DbVpc" {
  cidr_block = "${var.MYvpc-cidr}"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    Name = "DEVv2 DevEc2DbVpc"
	Environment = "${var.MYenvironment}"
  }
}
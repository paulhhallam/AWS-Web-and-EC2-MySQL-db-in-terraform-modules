resource "aws_vpc_dhcp_options" "mydhcp" {
  domain_name = "${var.MYDnsZoneName}"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags {
    Name = "My internal name"
	Environment = "${var.MYenvironment}"
  }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id = "${var.MYvpc_id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.mydhcp.id}"
}

/* DNS PART ZONE AND RECORDS */

resource "aws_route53_zone" "main" {
  name    = "${var.MYDnsZoneName}"
  vpc {
    vpc_id  = "${var.MYvpc_id}"
  }
  comment = "Managed by ME"
}

resource "aws_route53_record" "database" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name = "mydatabase.${var.MYDnsZoneName}"
  type = "A"
  ttl = "300"
  records = ["${var.MYdatabase_private_ip}"]
}

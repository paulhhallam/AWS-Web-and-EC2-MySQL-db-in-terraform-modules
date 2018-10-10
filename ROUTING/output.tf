output "TOPinternet_gateway_id"{
  value = "${aws_internet_gateway.gw.id}"
  }
output "TOPnetwork_acl_id"{
  value = "${aws_network_acl.all.id}"
  }
output "TOPeip_id"{
  value = "${aws_eip.forNat.id}"
  }
output "TOPnat_gateway_publicaza_id"{
  value = "${aws_nat_gateway.PublicAZA.id}"
  }
output "TOPsubnet_publicAZA_id"{
  value = "${aws_subnet.PublicAZA.id}"
  }
output "TOPsubnet_privateAZA_id"{
  value = "${aws_subnet.PrivateAZA.id}"
  }

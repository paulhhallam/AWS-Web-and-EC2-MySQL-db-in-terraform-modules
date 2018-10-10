output "TOPsubnet_publicAZA_id" {
  value = "${aws_subnet.PublicAZA.id}"
  }

output "TOPsubnet_privateAZA_id" {
  value = "${aws_subnet.PrivateAZA.id}"
  }

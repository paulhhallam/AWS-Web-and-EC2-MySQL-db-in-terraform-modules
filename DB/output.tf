output "TOPdatabase_private_ip" {
  value = "${aws_instance.database.private_ip}"
}

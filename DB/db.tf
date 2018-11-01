resource "aws_instance" "database" {
# ami           = "${lookup(var.MYamis, var.MYregion)}"
# NV - Centos
  ami = "ami-9887c6e7"
  instance_type = "t2.micro"
  associate_public_ip_address = "false"
  subnet_id = "${var.MYsubnet_privateAZA_id}"
  vpc_security_group_ids = ["${var.MYsecgrpdbid}"]
  key_name = "${var.aws_key_name}"
  tags {
    Name = "database"
	Environment = "${var.MYenvironment}"
  }
  user_data = "${file("database.txt")}"
}
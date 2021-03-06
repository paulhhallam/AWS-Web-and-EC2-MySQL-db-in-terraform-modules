resource "aws_instance" "webphpapp" {
# NV - Centos
  ami = "${lookup(var.MYamis, var.MYregion)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${var.MYsubnet_publicAZA_id}"
  vpc_security_group_ids = ["${var.MYsecfrntid}"]
  key_name = "${var.aws_key_name}"
  root_block_device {
	  delete_on_termination = true
	  }
  tags {
    Name = "phpapp"
	Environment = "${var.MYenvironment}"
  }
  user_data = "${file("webphpapp.txt")}"
}


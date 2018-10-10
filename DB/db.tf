resource "aws_instance" "database" {
  ami           = "${lookup(var.MYamis, var.MYregion)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "false"
  subnet_id = "${var.MYsubnet_privateAZA_id}"
  vpc_security_group_ids = ["${var.MYsecgrpdbid}"]
  key_name = "${var.aws_key_name}"
  tags {
        Name = "DEVv2 database"
  }
  user_data = <<HEREDOC
  #!/bin/bash
  yum update -y
  yum install -y mysql55-server
  service mysqld start
  /usr/bin/mysqladmin -u root password 'secret'
  mysql -u root -psecret -e "create user 'root'@'%' identified by 'secret';" mysql
  mysql -u root -psecret -e 'CREATE TABLE mytable (mycol varchar(255));' test
  mysql -u root -psecret -e "INSERT INTO mytable (mycol) values ('linuxacademythebest') ;" test
HEREDOC
}
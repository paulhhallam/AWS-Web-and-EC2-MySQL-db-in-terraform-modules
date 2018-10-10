resource "aws_instance" "webphpapp" {
  ami = "${lookup(var.MYamis, var.MYregion)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${var.MYsubnet_publicAZA_id}"
  vpc_security_group_ids = ["${var.MYsecfrntid}"]
  key_name = "${var.aws_key_name}"
  tags {
        Name = "DEVv2 phpapp"
  }

  user_data = <<HEREDOC
  #!/bin/bash
  yum update -y
  yum install -y httpd24 php56 php56-mysqlnd
  service httpd start
  chkconfig httpd on
  echo "<?php" >> /var/www/html/calldb.php
  echo "\$conn = new mysqli('mydatabase.linuxacademy.internal', 'root', 'secret', 'test');" >> /var/www/html/calldb.php
  echo "\$sql = 'SELECT * FROM mytable'; " >> /var/www/html/calldb.php
  echo "\$result = \$conn->query(\$sql); " >>  /var/www/html/calldb.php
  echo "while(\$row = \$result->fetch_assoc()) { echo 'the value is: ' . \$row['mycol'] ;} " >> /var/www/html/calldb.php
  echo "\$conn->close(); " >> /var/www/html/calldb.php
  echo "?>" >> /var/www/html/calldb.php
HEREDOC
  }


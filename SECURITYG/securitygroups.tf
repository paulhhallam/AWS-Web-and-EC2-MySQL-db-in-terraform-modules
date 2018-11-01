resource "aws_security_group" "FrontEnd" {
  name = "FrontEnd"
  vpc_id = "${var.MYvpc_id}"
  description = "ONLY HTTP CONNECTION INBOUND"
  tags {
    Name = "FrontEnd"
	Environment = "${var.MYenvironment}"
	}
  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
	}
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
	}
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_security_group" "Database" {
  name = "DEVv2 Database"
  vpc_id = "${var.MYvpc_id}"
  description = "ONLY tcp CONNECTION INBOUND"
  tags {
    Name = "database"
	Environment = "${var.MYenvironment}"
	}
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "TCP"
    security_groups = ["${aws_security_group.FrontEnd.id}"]
	}
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
	}
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
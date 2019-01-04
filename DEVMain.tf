provider "aws" {
  region     = "${var.TOPregion}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

module "vpc" {
  source = "./VPC/"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_key_name   = "${var.aws_key_name}"
  MYregion       = "${var.TOPregion}"
  MYvpc-cidr     = "${var.TOPvpc-cidr}"
}

# RELIES ON VPC
module "routing" {
  source = "./ROUTING/"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_key_name   = "${var.aws_key_name}"
  MYregion       = "${var.TOPregion}"
  MYvpc_id       = "${module.vpc.TOPvpc_id}"
}
# RELIES ON VPC
module "secgroups" {
  source = "./SECURITYG/"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_key_name   = "${var.aws_key_name}"
  MYvpc_id      = "${module.vpc.TOPvpc_id}"
}

# RELIES ON VPC DB
module "dns-and-dhcp" {
  source = "./DNS-AND-DHCP/"
  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_key_name   = "${var.aws_key_name}"
  MYregion       = "${var.TOPregion}"
  MYvpc_id       = "${module.vpc.TOPvpc_id}"
  MYdatabase_private_ip = "${module.db.TOPdatabase_private_ip}"
}

#EC2 relies on VPC, ROUTING and SECURITY GROUPS
module "ec2" {
  source = "./EC2/"
  aws_access_key        = "${var.aws_access_key}"
  aws_secret_key        = "${var.aws_secret_key}"
  aws_key_name          = "${var.aws_key_name}"
  MYregion              = "${var.TOPregion}"
  MYvpc_id              = "${module.vpc.TOPvpc_id}"
  MYsubnet_publicAZA_id = "${module.routing.TOPsubnet_publicAZA_id}"
  MYsecfrntid           = "${module.secgroups.TOPsecfrntid}"
}

#DB relies on VPC, ROUTING and SECURITY GROUPS
module "db" {
  source = "./DB/"
  aws_access_key              = "${var.aws_access_key}"
  aws_secret_key              = "${var.aws_secret_key}"
  aws_key_name                = "${var.aws_key_name}"
  MYregion                    = "${var.TOPregion}"
  MYvpc_id                    = "${module.vpc.TOPvpc_id}"
  MYsubnet_privateAZA_id      = "${module.routing.TOPsubnet_privateAZA_id}"
  MYsecgrpdbid                = "${module.secgroups.TOPsecgrpdbid}"
}

#  depends_on = ["aws_vpc.DevEc2DbVpc"]

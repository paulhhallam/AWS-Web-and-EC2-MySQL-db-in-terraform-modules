variable "MYdatabase_private_ip" {
  description = "DB Private ID"
  default = ""
}
  
variable "MYregion" {
  default = "us-east-2"
}

variable "MYaws_instance_type" {
    default = "t2.micro"
}

variable "MYenvironment" {
  default = "TFP"
  }

variable "MYamis" {
  type = "map"
   default = {
    "us-east-1" = "ami-b374d5a5"
	"us-east-2" = "ami-5e8bb23b"
    "us-west-2" = "ami-4b32be2b"
  } 
}

variable "MYsecgrpdbid" {
  description = "Security group database id"
  default = ""
}
  
variable "MYvpc_id" {
  description = "ID of VPC"
  default = ""
}

variable "MYsubnet_privateAZA_id" {
  description = "Private Network ID"
  default = ""
}

variable "MYsubnet_publicAZA_id" {
  description = "Public Network ID"
  default = ""
}

variable "MYsecfrntid" {
  description = "Security Group FrontEnd ID"
  default = ""
}

variable "MYeip_id" {
  description = "Elastic IP Address"
  default = ""
}

variable "MYnat_gateway_publicaza_id" {
  description = "Network address translation"
  default = ""
}

variable "MYRDSPWD" {
  default = "Password"
  }

variable "MYvpc-cidr" {
  default = "172.128.0.0/16"
}

variable "MYvpcsubn-pub-cidr" {
  default = "172.128.0.0/24"
}

variable "MYvpcsubn-pri-cidr" {
  default = "172.128.3.0/24"
}

variable "MYDnsZoneName" {
  default = "NET.int"
  description = "the internal dns name"
}

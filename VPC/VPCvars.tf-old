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

variable "MYamis" {
  type = "map"
   default = {
    "us-east-1" = "ami-b374d5a5"
	"us-east-2" = "ami-5e8bb23b"
    "us-west-2" = "ami-4b32be2b"
  } 
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
  default = "moluccan.int"
  description = "the internal dns name"
}

variable "TOPvpc_id" {
  description = "ID of VPC"
  default = ""
  }


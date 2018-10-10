variable "TOPdatabase_private_ip" {
  description = "my db pri ip"
  default = ""
}

variable "TOPregion" {
  default = "us-east-2"
}

variable "TOPaws_instance_type" {
  default = "t2.micro"
}

variable "TOPamis" {
  type = "map"
	default = {
    "us-east-1" = "ami-b374d5a5"
	"us-east-2" = "ami-5e8bb23b"
    "us-west-2" = "ami-4b32be2b"
  } 
}

variable "TOPsecgrpdbid" {
  description = "Security group database id"
  default = ""
  }

variable "TOPvpc_id" {
  description = "ID of VPC"
  default = ""
  }

variable "TOPsubnet_privateAZA_id" {
  description = "Private Network ID"
  default = ""
  }

variable "TOPsubnet_publicAZA_id" {
  description = "Public Subnet ID"
  default = ""
  }

variable "TOPsecfrntid" {
  description = "Security Group FrontEnd ID"
  default = ""
}

variable "TOPeip_id" {
  description = "Elastic IP Address"
  default = ""
}
variable "TOPnat_gateway_publicaza_id" {
  description = "Network address translation"
  default = ""
}

variable "TOPRDSPWD" {
  default = "Password"
  }

variable "TOPvpc-cidr" {
  default = "172.128.0.0/16"
  }

variable "TOPvpcsubn-pub-cidr" {
  default = "172.128.0.0/24"
  }

variable "TOPvpcsubn-pri-cidr" {
  default = "172.128.3.0/24"
  }

variable "TOPDnsZoneName" {
  default = "NET.int"
  description = "the internal dns name"
  }

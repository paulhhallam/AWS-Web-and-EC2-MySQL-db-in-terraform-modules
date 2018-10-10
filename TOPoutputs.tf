#output  "TOPdatabase_private_ip" {
  #value ="${var.TOPdatabase_private_ip}" 
#}
#
#output  "TOPregion" {
  #value ="${var.TOPregion}" 
#}
#
#output  "TOPaws_instance_type" {
  #value ="${var.TOPaws_instance_type}" 
#}
#
#output  "TOPsecgrpdbid" {
  #value ="${var.TOPsecgrpdbid}"
#  }
#
#output  "TOPvpc_id" {
#  value ="${var.TOPvpc_id}" 
#  }

output  "Module-vpc_id" {
  value ="${module.vpc.TOPvpc_id}" 
}

output  "TOPsubnet_privateAZA_id" {
  value ="${module.routing.TOPsubnet_privateAZA_id}"
}

output  "TOPsubnet_publicAZA_id" {
  value ="${module.routing.TOPsubnet_publicAZA_id}"  
}
#
output  "TOPsecfrntid" {
  value ="${module.secgroups.TOPsecfrntid}"
}
#
output  "TOPeip_id" {
  value ="${module.routing.TOPeip_id}" 
}
output  "TOPnat_gateway_publicaza_id" {
  value ="${module.routing.TOPnat_gateway_publicaza_id}"
}
#
output  "TOPRDSPWD" {
  value ="${var.TOPRDSPWD}"
}
#
output  "TOPvpc-cidr" {
  value ="${var.TOPvpc-cidr}" 
}
#
output  "TOPvpcsubn-pub-cidr" {
  value ="${var.TOPvpcsubn-pub-cidr}" 
}
#
output  "TOPvpcsubn-pri-cidr" {
  value ="${var.TOPvpcsubn-pri-cidr}"
}
#
output  "TOPDnsZoneName" {
  value ="${var.TOPDnsZoneName}" 
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA5Y6ED6DAE4I2EDOB"
  secret_key = "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"
}

module "Jenkins" {
  source  = "./Modules/Jenkins"
  keyname = "${var.keyname}"
  vpcid  = "${var.vpcid}"
  ami_id  = "${var.ami_id}"
}
module "AnsibleControl"{
  source  = "./Modules/Ansiblecontrol"
  keyname = "${var.keyname}"
  vpcid  = "${var.vpcid}"
  ansi_ami_id  = "${var.ansi_ami_id}"
}
module "TargetServer"{
  source  = "./Modules/TargetServer"
  keyname = "${var.keyname}"
  vpcid  = "${var.vpcid}"
  tar_ami_id  = "${var.tar_ami_id}"
}

module "RDS"{
   source  = "./Modules/RDS"
   
}
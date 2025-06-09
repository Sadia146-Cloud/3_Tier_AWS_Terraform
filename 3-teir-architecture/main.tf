provider "aws" {
    region = var.region
  
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    psaz1_cidr = var.psaz1_cidr
    psaz1_availabilityzone = var.psaz1_availabilityzone
    psaz1_name = var.psaz1_name
    psaz2_cidr = var.psaz2_cidr
    psaz2_availabilityzone = var.psaz2_availabilityzone
    psaz2_name = var.psaz2_name
    prsaz1_cidr = var.prsaz1_cidr
    prsaz1_availabilityzone = var.prsaz1_availabilityzone
    prsaz1_name = var.prsaz1_name
    prsaz2_cidr = var.prsaz2_cidr
    prsaz2_availabilityzone = var.prsaz2_availabilityzone
    prsaz2_name = var.prsaz2_name
    igw_name = var.igw_name
    nat_name = var.nat_name
    public_routename = var.public_routename
    private_routename = var.private_routename
    DB1s_cidr = var.DB1s_cidr
    DB1s_availabilityzone = var.DB1s_availabilityzone
    DB1s_name = var.DB1s_name
    DB2s_cidr = var.DB2s_cidr
    DB2s_availabilityzone = var.DB2s_availabilityzone
    DB2s_name = var.DB2s_name
    DB_routname = var.DB_routname
}

module "sg" {
    source = "./modules/sg"
    public_sgname =var.public_sgname
    vpc_id = module.vpc.vpc_id
    private_sgname = var.private_sgname
}

module "LB" {
    source = "./modules/LB"
    vpc_id = module.vpc.vpc_id
    lb_sgname = var.lb_sgname
    public_subnet_ids = module.vpc.public_subnet_ids
    lb_name = var.lb_name
    private_lb_sgname = var.private_lb_sgname
    private_subnet_ids = module.vpc.private_subnet_ids
    internal_lb_name = var.internal_lb_name
}

module "ASG" {
  source = "./modules/ASG"
  ami = var.ami
  instance_type = var.instance_type
  securitygroup_id = module.sg.securitygroup_id
  keypair = var.keypair
  target_group_arn = module.LB.target_group_arn
  public_subnet_ids = module.vpc.public_subnet_ids
  private_ami = var.private_ami
  private_securitygroup_id = module.sg.private_securitygroup_id
  internal_target_group_arn = module.LB.internal_target_group_arn
  private_subnet_ids = module.vpc.private_subnet_ids

}

module "DB" {
    source = "./modules/DB"
    DB_subnet_ids = module.vpc.DB_subnet_ids
    DB_subnetgroupname = var.DB_subnetgroupname
    vpc_id = module.vpc.vpc_id
    DB_sgname = var.DB_sgname
    DB_name = var.DB_name
    DB_instancetype = var.DB_instancetype
}

#module "ec2" {
   # source = "./modules/ec2"
   # public_instancename1 = var.public_instancename1
   # instance_type = var.instance_type
    #securitygroup_id = module.sg.securitygroup_id
    #keypair = var.keypair
    #ami = var.ami
    #public_instancename2 = var.public_instancename2
    #public_subnet_ids = module.vpc.public_subnet_ids
#}
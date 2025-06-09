resource "aws_instance" "public_instance_1" {
    ami = var.ami
    key_name = var.keypair
    subnet_id = var.public_subnet_ids[0]
    security_groups = [var.securitygroup_id]
    instance_type = var.instance_type
    tags = {
        Name = var.public_instancename1
    }
  
}

resource "aws_instance" "public_instance_2" {
    ami = var.ami
    key_name = var.keypair
    subnet_id = var.public_subnet_ids[1]
    security_groups = [var.securitygroup_id]
    instance_type = var.instance_type
    tags = {
        Name = var.public_instancename2
    }
  
}
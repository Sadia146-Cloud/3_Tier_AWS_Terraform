resource "aws_db_subnet_group" "mysql" {
  name       = "mysql-subnet-group"
  subnet_ids = var.DB_subnet_ids

  tags = {
    Name = var.DB_subnetgroupname
  }
}

resource "aws_security_group" "DB_sg" {
    vpc_id = var.vpc_id

    ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.DB_sgname
  }
  
}

resource "aws_db_instance" "my_sqlDB" {
  allocated_storage    = 10
  db_name              = var.DB_name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.DB_instancetype
  username             = "Admin"
  password             = "password1234"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  multi_az                = false
  publicly_accessible     = false
  db_subnet_group_name = aws_db_subnet_group.mysql.name
  vpc_security_group_ids = [aws_security_group.DB_sg.id]
}

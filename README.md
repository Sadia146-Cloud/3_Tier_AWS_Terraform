# 3-Tier AWS Architecture using Terraform

This project uses Terraform to deploy a 3-tier architecture on AWS, consisting of:

- **Web Tier** (EC2 + Load Balancer)
- **Application Tier** (Auto Scaling Group)
- **Database Tier** (RDS)
- **Networking & Security** (VPC, subnets, security groups)

---

## 🧱 Modules Used

The project is modularized into the following components:

- **vpc**: Creates VPC, subnets, route tables, and gateways
- **sg**: Creates security groups for each tier
- **ec2**: Launches EC2 instances for the Web tier
- **LB**: Provisions an Application Load Balancer (ALB)
- **ASG**: Sets up Auto Scaling Group for Application tier
- **DB**: Deploys an RDS instance (Database tier)

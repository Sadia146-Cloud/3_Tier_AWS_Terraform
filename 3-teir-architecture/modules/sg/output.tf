#public sg group output
output "securitygroup_id" {
  value = aws_security_group.public_sg.id
}

#private sg group output
output "private_securitygroup_id" {
  value = aws_security_group.private_sg.id
  
}
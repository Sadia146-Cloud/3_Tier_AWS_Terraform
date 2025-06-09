#external LB output
output "target_group_arn" {
  value = aws_lb_target_group.public-Tg.arn
}

#internal LB output
output "internal_target_group_arn" {
  value = aws_lb_target_group.private-Tg.arn
  
}
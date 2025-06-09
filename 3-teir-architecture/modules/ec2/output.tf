output "instance_ids" {
  value = [aws_instance.public_instance_1.id , aws_instance.public_instance_2.id]
}


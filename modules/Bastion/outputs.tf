output "bastion_instance_id" {
  value       = aws_instance.bastion.id
  description = "The ID of the Bastion EC2 instance"
}

output "bastion_public_ip" {
  value       = aws_instance.bastion.public_ip
  description = "The public IP of the Bastion EC2 instance"
}

output "bastion_private_ip" {
  value       = aws_instance.bastion.private_ip
  description = "The private IP of the Bastion EC2 instance"
}

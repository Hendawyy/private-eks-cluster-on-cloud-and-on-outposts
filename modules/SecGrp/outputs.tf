output "bastion_sg_id" {
  value       = aws_security_group.bastion_sg.id
  description = "ID of the Bastion Host security group"
}

output "worker_sg_id" {
  value       = aws_security_group.worker_sg.id
  description = "ID of the EKS Worker Nodes security group"
}

output "cluster_sg_id" {
  value       = aws_security_group.cluster_sg.id
  description = "ID of the EKS Control Plane security group"
}

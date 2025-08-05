output "eks_Cluster_role_arn" {
  value = aws_iam_role.eks_Cluster_role.arn
}

output "bastion_instance_profile_name" {
  value = aws_iam_instance_profile.bastion_instance_profile.name
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}

output "eks_node_role_profile" {
  value = aws_iam_instance_profile.eks_node_instance_profile.arn
}

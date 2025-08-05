output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks" {
  value = aws_eks_cluster.eks
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}


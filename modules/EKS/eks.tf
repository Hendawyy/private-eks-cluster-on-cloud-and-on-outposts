resource "aws_eks_cluster" "eks" {
  name     = "${var.prefix}-${var.eks_name}"
  version  = var.eks_version
  role_arn = var.eks_role_arn

  vpc_config {
    endpoint_public_access  = false
    endpoint_private_access = true
    subnet_ids              = var.Private_Subnets_ID
    security_group_ids      = [var.eks_cluster_sg_id]
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  tags = {
    Name = "${var.prefix}-${var.eks_name}"
  }

  depends_on = [var.eks_role_arn]
}

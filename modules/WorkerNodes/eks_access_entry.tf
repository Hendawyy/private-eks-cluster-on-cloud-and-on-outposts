resource "aws_eks_access_entry" "worker_node_access" {
  cluster_name = "${var.prefix}-${var.eks_name}"

  principal_arn = var.ng_role_arn
  type          = "STANDARD"

  user_name = "arn:aws:sts::340248583790:assumed-role/${basename(var.ng_role_arn)}/{{SessionName}}"
}

resource "aws_eks_access_policy_association" "ng_role_policy" {
  cluster_name  = "${var.prefix}-${var.eks_name}"
  principal_arn = var.ng_role_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type       = "cluster"
    namespaces = []
  }
}

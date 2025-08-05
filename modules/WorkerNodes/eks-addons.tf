resource "aws_eks_addon" "vpc_cni" {
  cluster_name                = "${var.prefix}-${var.eks_name}"
  addon_name                  = "vpc-cni"
  addon_version               = local.latest_vpc_cni_version
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "pod_identity" {
  cluster_name                = "${var.prefix}-${var.eks_name}"
  addon_name                  = "eks-pod-identity-agent"
  addon_version               = local.latest_pod_identity_version
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name                = "${var.prefix}-${var.eks_name}"
  addon_name                  = "kube-proxy"
  addon_version               = local.latest_kube_proxy_version
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "coredns" {
  cluster_name                = "${var.prefix}-${var.eks_name}"
  addon_name                  = "coredns"
  addon_version               = local.latest_coredns_version
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on                  = [aws_autoscaling_group.eks-asg]
}

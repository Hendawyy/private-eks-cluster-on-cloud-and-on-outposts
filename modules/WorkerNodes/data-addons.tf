data "aws_eks_addon_version" "vpc_cni" {
  addon_name         = "vpc-cni"
  kubernetes_version = var.eks_version
}

data "aws_eks_addon_version" "pod_identity" {
  addon_name         = "eks-pod-identity-agent"
  kubernetes_version = var.eks_version
}

data "aws_eks_addon_version" "kube_proxy" {
  addon_name         = "kube-proxy"
  kubernetes_version = var.eks_version
}

data "aws_eks_addon_version" "coredns" {
  addon_name         = "coredns"
  kubernetes_version = var.eks_version
}

locals {
  latest_vpc_cni_version      = data.aws_eks_addon_version.vpc_cni.version
  latest_pod_identity_version = data.aws_eks_addon_version.pod_identity.version
  latest_kube_proxy_version   = data.aws_eks_addon_version.kube_proxy.version
  latest_coredns_version      = data.aws_eks_addon_version.coredns.version
}

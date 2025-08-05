resource "aws_iam_role" "eks_node_role" {
  name = "${var.prefix}-eks-Node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.prefix}-eks-Node-role"
  }
}

resource "aws_iam_role_policy_attachment" "attach_managed_policies_node" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPullOnly",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSComputePolicy",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ])

  role       = aws_iam_role.eks_node_role.name
  policy_arn = each.value
}


resource "aws_iam_instance_profile" "eks_node_instance_profile" {
  name = "${var.prefix}-eks-NodeProfile"
  role = aws_iam_role.eks_node_role.name
}

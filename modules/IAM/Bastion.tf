resource "aws_iam_instance_profile" "bastion_instance_profile" {
  name = "${var.prefix}-bastion-instance-profile"
  role = aws_iam_role.bastion_role.name
}

resource "aws_iam_role" "bastion_role" {
  name = "${var.prefix}-bastion-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "bastion_custom_eks_policy" {
  name = "${var.prefix}-bastion-eks-policy"
  role = aws_iam_role.bastion_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "Statement1",
        Effect = "Allow",
        Action = [
          "eks:*",
          "eks-auth:*",
          "sts:*"
        ],
        Resource = [
          "*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "bastion_ssm" {
  role       = aws_iam_role.bastion_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

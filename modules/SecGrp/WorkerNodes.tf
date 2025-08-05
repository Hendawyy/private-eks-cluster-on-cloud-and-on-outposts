resource "aws_security_group" "worker_sg" {
  name        = "${var.prefix}-eks-worker-sg"
  description = "Security group for EKS worker nodes allowing all traffic"
  vpc_id      = var.VPC_ID

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-EKSWorkerSecurityGroup"
  }
}

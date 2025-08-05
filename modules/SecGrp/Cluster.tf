resource "aws_security_group" "cluster_sg" {
  name        = "${var.prefix}-eks-cluster-sg"
  description = "Security group for EKS Control Plane allowing traffic from workers and HTTPS from bastion"
  vpc_id      = var.VPC_ID

  # Allow traffic from worker SG
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.worker_sg.id]
    description     = "Allow all traffic from EKS Worker Nodes"
  }

  # Allow HTTPS from Bastion SG
  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
    description     = "Allow HTTPS traffic from Bastion Host"
  }

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix}-EKSClusterSecurityGroup"
  }
}
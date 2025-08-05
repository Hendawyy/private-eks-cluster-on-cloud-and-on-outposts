resource "aws_security_group" "bastion_sg" {
  name        = "${var.prefix}-bastion-sg"
  description = "Security group for Bastion Host with full inbound and outbound access"
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
    Name = "${var.prefix}-BastionSecurityGroup"
  }
}

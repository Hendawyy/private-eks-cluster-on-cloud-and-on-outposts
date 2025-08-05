resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  availability_zone           = var.zone
  iam_instance_profile        = var.bastion_instance_profile_name

  root_block_device {
    volume_type = "gp2"
    volume_size = 10
  }

  user_data = <<-EOF
              #!/bin/bash
              set -e

              # Update and install AWS CLI
              yum update -y
              yum install -y awscli

              # Install kubectl
              curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
              chmod +x kubectl
              mv kubectl /usr/local/bin/

              # Verify installation
              kubectl version --client
              
              touch /tmp/user_data_done

              EOF

  tags = {
    Name = "${var.prefix}-bastion"
  }
}

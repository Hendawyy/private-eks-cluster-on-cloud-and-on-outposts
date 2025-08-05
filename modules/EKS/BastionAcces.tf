data "template_file" "aws_auth" {
  template = file("${path.module}/templates/aws-auth.yaml.tpl")
  vars = {
    ng_role_arn = var.ng_role_arn
  }
}

resource "null_resource" "configure_bastion" {
  depends_on = [aws_eks_cluster.eks]

  connection {
    type        = "ssh"
    host        = var.bastion_public_ip
    user        = "ec2-user"
    private_key = file(var.private_key)
  }


  provisioner "file" {
    content     = data.template_file.aws_auth.rendered
    destination = "/home/ec2-user/aws-auth.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "aws configure set aws_access_key_id ${var.aws_access_key_id}",
      "aws configure set aws_secret_access_key ${var.aws_secret_access_key}",
      "aws configure set aws_session_token ${var.aws_session_token}",
      "aws configure set default.region ${var.region}",
      "aws configure set output json",
      "aws eks update-kubeconfig --name ${var.prefix}-${var.eks_name} --region ${var.region}",
      "kubectl config use-context arn:aws:eks:${var.region}:340248583790:cluster/${var.prefix}-${var.eks_name}",
      "kubectl apply -f /home/ec2-user/aws-auth.yaml"
    ]
  }

}

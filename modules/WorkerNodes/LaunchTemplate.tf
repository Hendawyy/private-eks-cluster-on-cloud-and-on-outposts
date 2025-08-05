resource "aws_launch_template" "eks-lt" {
  name_prefix            = "${var.prefix}-selfmanaged-lt"
  image_id               = var.worker_image_id
  instance_type          = var.instance_type
  key_name               = var.Key_Name
  vpc_security_group_ids = [var.eks_nodes_sg_id]

  user_data = base64encode(templatefile("${path.module}/UserData/eks-Script.sh", {
    cluster_name     = var.Cluster_Name
    cluster_endpoint = var.eks_cluster_endpoint
    capacity_type    = var.Capacity_Type
  }))

  iam_instance_profile {
    arn = var.worker_instance_profile_arn
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name                                        = "${var.prefix}-selfmanaged-lt"
      "kubernetes.io/cluster/${var.Cluster_Name}" = "owned"
    }
  }

  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }
}

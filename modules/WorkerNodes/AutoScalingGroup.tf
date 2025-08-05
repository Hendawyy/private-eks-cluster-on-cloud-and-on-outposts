resource "aws_autoscaling_group" "eks-asg" {
  name                = "${var.prefix}-WorkerNodes-ASG"
  desired_capacity    = 4
  min_size            = 2
  max_size            = 6
  vpc_zone_identifier = var.Private_Subnets_ID
  launch_template {
    id      = aws_launch_template.eks-lt.id
    version = "$Latest"
  }
  health_check_type    = "EC2"
  force_delete         = true
  termination_policies = ["OldestInstance"]

  tag {
    key                 = "kubernetes.io/cluster/${var.Cluster_Name}"
    value               = "owned"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/enabled"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "k8s.io/cluster-autoscaler/${var.Cluster_Name}"
    value               = "owned"
    propagate_at_launch = true
  }
  depends_on = [aws_launch_template.eks-lt,
    aws_eks_access_entry.worker_node_access,
  aws_eks_access_policy_association.ng_role_policy]
}

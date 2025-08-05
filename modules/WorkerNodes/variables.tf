variable "prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "eks_name" {
  description = "EKS cluster name"
  type        = string
}

variable "eks_version" {
  description = "EKS Kubernetes version"
  type        = string
}

variable "Private_Subnets_ID" {
  description = "List of private subnet IDs for worker nodes"
  type        = list(string)
}

variable "ng_role_arn" {
  description = "IAM Role ARN for EKS worker node group"
  type        = string
}

variable "Cluster_Name" {
  description = "EKS cluster name (same as eks_name, but explicitly passed)"
  type        = string
}

variable "Capacity_Type" {
  description = "Capacity type of worker nodes (e.g., ON_DEMAND, SPOT)"
  type        = string
  default     = "ON_DEMAND"
}

variable "instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
}
variable "worker_image_id" {
  description = "AMI ID for worker nodes"
  type        = string
}


variable "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  type        = string
}

variable "Key_Name" {
  description = "EC2 key pair name for worker nodes"
  type        = string
}

variable "VPC_ID" {
  description = "VPC ID where worker nodes are deployed"
  type        = string
}

variable "eks" {
  description = "EKS cluster resource or output reference (if needed)"
  type        = any
}

variable "eks_nodes_sg_id" {
  description = "Security group ID for EKS worker nodes"
  type        = string
}

variable "worker_instance_profile_arn" {
  description = "IAM Instance Profile name for worker nodes"
  type        = string
}

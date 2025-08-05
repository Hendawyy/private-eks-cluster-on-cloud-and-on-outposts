variable "bastion_ami_id" {
  description = "AMI ID for the Bastion Host"
  type        = string
}

variable "bastion_instance_type" {
  description = "Instance type for the Bastion Host"
  type        = string
}

variable "cluster_ami_id" {
  description = "AMI ID for the EKS Cluster"
  type        = string
}

variable "cluster_instance_type" {
  description = "Instance type for the EKS Cluster"
  type        = string
}

variable "private_key" {
  description = "Path to the private key file for SSH access"
  type        = string
}

variable "worker_image_id" {
  description = "AMI ID for the EKS Worker Nodes"
  type        = string
}

variable "worker_instance_type" {
  description = "Instance type for the EKS Worker Nodes"
  type        = string
}

variable "aws_session_token" {
  description = "AWS session token for authentication"
  type        = string
  sensitive   = true
}

variable "aws_access_key_id" {
  description = "AWS access key ID for authentication"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS secret access key for authentication"
  type        = string
  sensitive   = true
}
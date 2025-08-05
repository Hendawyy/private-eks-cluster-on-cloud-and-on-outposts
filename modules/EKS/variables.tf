variable "prefix" {
  description = "Prefix for naming EKS resources"
  type        = string
}

variable "region" {
  description = "AWS region where EKS cluster is deployed"
  type        = string
}

variable "zone" {
  description = "Availability zone used for EKS deployment"
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

variable "eks_role_arn" {
  description = "IAM Role ARN for EKS cluster"
  type        = string
}

variable "Private_Subnets_ID" {
  description = "List of private subnet IDs used by the EKS cluster"
  type        = list(string)
}

variable "VPC_ID" {
  description = "VPC ID where EKS is deployed"
  type        = string
}

variable "eks_cluster_sg_id" {
  description = "Security group ID for EKS cluster control plane"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EKS worker nodes"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name for worker nodes"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
}

variable "bastion_public_ip" {
  description = "Public IP of the Bastion host for EKS access"
  type        = string
}

variable "private_key" {
  description = "Path to the private key file for SSH access to the Bastion host"
  type        = string
}

variable "ng_role_arn" {
  description = "IAM Role ARN for EKS node group"
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

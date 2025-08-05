variable "prefix" {
  description = "Prefix for all resources"
}

variable "region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "zone" {
  description = "availability zone for Bastion Host"
  type        = string
}

variable "VPC_ID" {
  description = "VPC ID"
}

variable "subnet" {
  description = "Public subnet ID"
}

variable "sg_id" {
  description = "Security group ID for the Bastion Host"
}

variable "ami_id" {
  description = "AMI ID for the Bastion Host"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access to the Bastion Host"
  type        = string
}

variable "outpost_ID" {
  description = "Outpost ID where the Bastion Host will be deployed"
  type        = string
}

variable "outpost_arn" {
  description = "ARN of the Outpost where EKS is deployed"
}

variable "instance_type" {
  description = "Instance type for the Bastion Host"
  type        = string
}

variable "bastion_instance_profile_name" {
  description = "Instance profile name for the Bastion Host"
  type        = string
}

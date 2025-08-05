output "bastion_public_ip" {
  value       = module.Bastion.bastion_public_ip
  description = "The public IP of the Bastion EC2 instance"
}

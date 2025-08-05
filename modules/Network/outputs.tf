output "vpc_id" {
  value = data.aws_vpc.existing-aws-controltower-VPC.id
}

output "private_subnet_ids" {
  value = [
    data.aws_subnet.existing-private-subnet1.id,
    data.aws_subnet.existing-private-subnet2.id,
    data.aws_subnet.existing-private-subnet3.id
  ]
}

output "public_subnet_id" {
  value = data.aws_subnet.existing-public-subnet4.id
}

output "private_subnet_region_ids" {
  value = [
    data.aws_subnet.existing-private-subnet-region-1.id,
    data.aws_subnet.existing-private-subnet-region-2.id
  ]
}

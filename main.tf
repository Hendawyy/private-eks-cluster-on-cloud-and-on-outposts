module "Network" {
  source   = "./modules/Network"
  prefix   = local.prefix
  zone     = local.zone
  eks_name = local.eks_name
}

module "IAM" {
  source   = "./modules/IAM"
  prefix   = local.prefix
  eks_name = local.eks_name
}

module "Keys" {
  source = "./modules/Keys"
}

module "SecGrp" {
  source = "./modules/SecGrp"
  prefix = local.prefix
  VPC_ID = module.Network.vpc_id
}

module "Bastion" {
  source                        = "./modules/Bastion"
  prefix                        = local.prefix
  outpost_ID                    = local.outpost_ID
  outpost_arn                   = local.outpost_arn
  region                        = local.region
  zone                          = local.zone
  VPC_ID                        = module.Network.vpc_id
  subnet                        = module.Network.public_subnet_id
  sg_id                         = module.SecGrp.bastion_sg_id
  ami_id                        = var.bastion_ami_id
  key_name                      = module.Keys.TestHendawy_key_pair
  bastion_instance_profile_name = module.IAM.bastion_instance_profile_name
  instance_type                 = var.bastion_instance_type
  depends_on = [
    module.SecGrp,
    module.Network,
    module.IAM,
    module.Keys,
  ]
}

module "EKS" {
  source                = "./modules/EKS"
  prefix                = local.prefix
  region                = local.region
  zone                  = local.zone
  eks_name              = local.eks_name
  eks_version           = local.eks_version
  eks_role_arn          = module.IAM.eks_Cluster_role_arn
  Private_Subnets_ID    = module.Network.private_subnet_region_ids
  VPC_ID                = module.Network.vpc_id
  eks_cluster_sg_id     = module.SecGrp.cluster_sg_id
  ami_id                = var.cluster_ami_id
  key_name              = module.Keys.TestHendawy_key_pair
  instance_type         = var.cluster_instance_type
  bastion_public_ip     = module.Bastion.bastion_public_ip
  private_key           = var.private_key
  aws_session_token     = var.aws_session_token
  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  ng_role_arn           = module.IAM.eks_node_role_arn
  depends_on = [
    module.SecGrp,
    module.Network,
    module.Keys,
    module.Bastion
  ]
}

module "WorkerNodes" {
  source                      = "./modules/WorkerNodes"
  prefix                      = local.prefix
  eks_name                    = local.eks_name
  eks_version                 = local.eks_version
  Private_Subnets_ID          = module.Network.private_subnet_ids
  ng_role_arn                 = module.IAM.eks_node_role_arn
  Cluster_Name                = module.EKS.cluster_name
  instance_type               = var.worker_instance_type
  worker_image_id             = var.worker_image_id
  eks_cluster_endpoint        = module.EKS.eks_cluster_endpoint
  Key_Name                    = module.Keys.TestHendawy_key_pair
  VPC_ID                      = module.Network.vpc_id
  eks                         = module.EKS.eks
  eks_nodes_sg_id             = module.SecGrp.worker_sg_id
  worker_instance_profile_arn = module.IAM.eks_node_role_profile
  depends_on                  = [module.EKS]
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source     = "git::https://github.com/ceibo-it/terraform-aws-vpc.git?ref=tags/0.0.1"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  cidr_block = var.cidr_block
}

module "public_subnets" {
  source              = "../../"
  namespace           = var.namespace
  stage               = var.stage
  name                = var.name
  availability_zones  = var.availability_zones
  vpc_id              = module.vpc.vpc_id
  cidr_blocks         = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  type                = "public"
  igw_id              = module.vpc.igw_id
  nat_gateway_enabled = true
}

module "private_subnets" {
  source             = "../../"
  namespace          = var.namespace
  stage              = var.stage
  name               = var.name
  availability_zones = var.availability_zones
  vpc_id             = module.vpc.vpc_id
  cidr_blocks        = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  type               = "private"

  # Map of AZ names to NAT Gateway IDs that was created in "public_subnets" module
  az_ngw_ids = module.public_subnets.az_ngw_ids
}


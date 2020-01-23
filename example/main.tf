# Terraform configuration 
terraform {
  required_version = ">= 0.12"
}

#Provider configuration. Typically there will only be one provider config, unless working with multi account and / or multi region resources
provider "aws" {
  region = var.provider_region
}

#################
# EFS Module:   #
#################

// Create an EFS FS
module "demo_efs" {
  source = "git@github.com:CloudMage-TF/AWS-EFS-Module?ref=v1.0.0"

  // Required Variables
  efs_name             = var.fs_name
  efs_subnets          = var.fs_subnets
  
  // Optional Variables
  # efs_performance_mode  = var.fs_perfmode
  # efs_throughput_mode   = var.fs_throughput_mode
  # efs_throughput_value  = var.fs_throughput
  # efs_enable_encryption = var.fs_encryption
  # efs_kms_key_arn       = var.fs_cmk
  # efs_tags              = var.fs_tags
}

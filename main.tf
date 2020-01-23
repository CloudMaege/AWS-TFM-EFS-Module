######################
# Data Sources:      #
######################
// Caller Identity for Account Ids
data "aws_caller_identity" "current" {}

######################
# EFS File System:   #
######################
resource "aws_efs_file_system" "this" {
  creation_token                  = var.efs_name
  performance_mode                = var.efs_performance_mode
  throughput_mode                 = var.efs_throughput_mode
  provisioned_throughput_in_mibps = var.efs_throughput_mode == "provisioned" ? var.efs_throughput_value : null
  encrypted                       = var.efs_enable_encryption
  kms_key_id                      = var.efs_enable_encryption == true ? var.efs_kms_key_arn : null
  
  // Set the Name tag, and add Created By and Creation Date with ignore change lifecycle policy. Allow Updated_On to update on each exectuion.
  tags = merge(
    var.efs_tags,
    {
      Name            = lower(format("%s", var.efs_name)),
      Created_By      = data.aws_caller_identity.current.user_id
      Creator_ARN     = data.aws_caller_identity.current.arn
      Creation_Date   = timestamp()
      Updated_On      = timestamp()
      Encrypted       = format("%s", var.efs_enable_encryption)
      CMK_ARN         = var.efs_kms_key_arn != "NULL" ? var.efs_kms_key_arn : null
    }
  )

  lifecycle {
    ignore_changes = [tags["Created_By"], tags["Creation_Date"], tags["Creator_ARN"]]
  }

  // Not Currently Enabled as transitioning files to an IA Storage class may not be desired by the majority.
  # lifecycle_policy {
  #   transition_to_ia = "AFTER_30_DAYS"
  # }
}

###########################
# EFS FiileSystem Mounts: #
###########################
resource "aws_efs_mount_target" "this" {
  count          = length(var.efs_subnets)
  
  file_system_id = aws_efs_file_system.this.id
  subnet_id      = var.efs_subnets[count.index]
}
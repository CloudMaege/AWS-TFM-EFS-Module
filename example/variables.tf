###########################################################################
# Terraform Config Vars:                                                  #
###########################################################################
variable "provider_region" {
  type        = string
  description = "AWS region to use when making calls to the AWS provider."
}


###########################################################################
# Required EFS Module Vars:                                               #
#-------------------------------------------------------------------------#
# The following variables require consumer defined values to be provided. #
###########################################################################
variable "fs_name" {
  type        = string
  description = "Unique Name that will be assigned to the EFS File System being provisioned."
}

variable "fs_subnets" {
  type        = list(string)
  description = "Specify a list of Subnet Ids where EFS mount points for the provisioned EFS FileSystem should be created."
  default     = []
}


###########################################################################
# Optional EFS Module Vars:                                               #
#-------------------------------------------------------------------------#
# The following variables have default values already set by the module.  #
# They will not need to be included in a project root module variables.tf #
# file unless a non-default value needs be assigned to the variable.      #
###########################################################################
variable "fs_perfmode" {
  type        = string
  description = "Specify the desired EFS file system performance mode. Valid values can be either 'generalPurpose' or 'maxIO'. Default set to 'generalPurpose'"
  default     = "generalPurpose"
}

variable "fs_throughput_mode" {
  type        = string
  description = "Specify the desired EFS throughput mode. Valid values can be either 'bursting' or 'provisioned'. Default set to 'bursting'"
  default     = "bursting"
}

variable "fs_throughput" {
  type        = number
  description = "Specify the desired EFS throughput value in MiB. This Variable is required if efs_throughput_mode is set to provisioned. Valid value range is 1-1024. Note that there are additional costs for using EFS provisioned throughput mode."
  default     = 0
}

variable "fs_encryption" {
  type        = bool
  description = "Flag to enable EFS FileSystem encryption."
  default     = false
}

variable "fs_cmk" {
  type        = string
  description = "The key that will be used to encrypt the EFS FileSystem. If the default value of AES256 is unchanged, S3 will encrypt objects with the default KMS key. If a KMS CMK ARN is provided, then S3 will encrypt objects with the specified KMS key instead."
  default     = "NULL"
}

variable "fs_tags" {
  type        = map
  description = "Specify any tags that should be added to the EFS FileSystem being provisioned."
  default     = {
    Provisioned_By = "Terraform"
    GitHub_URL     = "https://github.com/CloudMage-TF/AWS-EFS-Module.git"
  }
}

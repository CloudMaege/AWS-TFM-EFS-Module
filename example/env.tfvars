###########################################################################
# Terraform Config Vars:                                                  #
###########################################################################


###########################################################################
# Required EFS Module Vars:                                               #
#-------------------------------------------------------------------------#
# The following variables require consumer defined values to be provided. #
###########################################################################
fs_name            = "EFS-Test-FS"
fs_subnets         = ["subnet-12345678"]


###########################################################################
# Optional EFS Module Vars:                                               #
#-------------------------------------------------------------------------#
# The following variables have default values already set by the module.  #
# They will not need to be included in a project root module variables.tf #
# file unless a non-default value needs be assigned to the variable.      #
###########################################################################
fs_perfmode        = "generalPurpose"
fs_throughput_mode = "bursting"
fs_throughput      = 0
fs_encryption      = false
fs_cmk             = "NULL"
fs_tags            = {
    Provisoned_By       = "Terraform"
    Module_GitHub_URL   = "https://github.com/CloudMage-TF/AWS-EFS-Module.git"
}
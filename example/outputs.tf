############################
# EFS File System Outputs: #
############################
output "efs_id" {
  value = module.demo_efs.efs_id
}

output "efs_arn" {
  value = module.demo_efs.efs_arn
}

output "efs_dns_name" {
  value = module.demo_efs.efs_dns_name
}

#############################
# EFS Mount Points Outputs: #
#############################
output "efs_mount_id" {
  value = module.demo_efs.*.efs_mount_id
}

output "efs_mount_arn" {
  value = module.demo_efs.*.efs_mount_arn
}

output "efs_mount_dns_name" {
  value = module.demo_efs.*.efs_mount_dns_name
}

output "efs_mount_eni" {
  value = module.demo_efs.*.efs_mount_eni
}

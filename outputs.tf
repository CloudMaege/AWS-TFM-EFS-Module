######################
# EFS File System:   #
######################
output "efs_id" {
  value = aws_efs_file_system.this.id
}

output "efs_arn" {
  value = aws_efs_file_system.this.arn
}

output "efs_dns_name" {
  value = aws_efs_file_system.this.dns_name
}

######################
# EFS Mount Points:  #
######################
output "efs_mount_id" {
  value = aws_efs_mount_target.this.*.id
}

output "efs_mount_arn" {
  value = aws_efs_mount_target.this.*.file_system_arn
}

output "efs_mount_dns_name" {
  value = aws_efs_mount_target.this.*.dns_name
}

output "efs_mount_eni" {
  value = aws_efs_mount_target.this.*.network_interface_id
}

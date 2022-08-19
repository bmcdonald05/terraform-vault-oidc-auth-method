output "oidc_mount_accessor" {
  description = "The mount accessor for this OIDC auth method."
  value       = module.root_oidc.oidc_accessor
}

output "oidc_path" {
  description = "The path this OIDC auth method was enabled at."
  value       = module.root_oidc.oidc_path
}

output "external_group_id" {
  description = "The ID of the created external group"
  value       = module.root_oidc.external_group_id
}

output "external_group_alias_id" {
  description = "The ID of the created group alias"
  value       = module.root_oidc.external_group_alias_id
}
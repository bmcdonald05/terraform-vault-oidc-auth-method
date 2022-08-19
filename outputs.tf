output "oidc_accessor" {
  description = "The accessor for this OIDC auth method."
  value       = vault_jwt_auth_backend.oidc.accessor
}

output "oidc_path" {
  description = "The path this OIDC auth method was enabled at."
  value       = vault_jwt_auth_backend.oidc.path
}

output "external_group_id" {
  description = "The ID of the created external group"
  value       = vault_identity_group.oidc_admin_group.id
}

output "external_group_alias_id" {
  description = "The ID of the created group alias"
  value       = vault_identity_group_alias.oidc_admin_group_alias.id
}
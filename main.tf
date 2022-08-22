resource "vault_jwt_auth_backend" "oidc" {
  description = "Standard OIDC Authentication Method"

  path               = var.path
  type               = "oidc"
  oidc_discovery_url = var.oidc_discovery_url
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  default_role       = "default"

}

resource "vault_jwt_auth_backend_role" "default" {
  backend                 = vault_jwt_auth_backend.oidc.path
  role_name               = "default"
  token_no_default_policy = var.no_default_policy # Should default role be assigned default Vault policy
  user_claim              = var.user_claim
  oidc_scopes             = var.oidc_scopes
  groups_claim            = var.groups_claim
  allowed_redirect_uris   = var.allowed_redirect_uris
  verbose_oidc_logging    = var.enable_debug_log # Enable to troubleshoot issues
  token_ttl               = var.token_ttl
  token_max_ttl           = var.token_max_ttl
}

resource "vault_identity_group" "oidc_admin_group" {
  name     = var.group_name
  type     = "external"
  policies = var.additional_policies
}

resource "vault_identity_group_alias" "oidc_admin_group_alias" {
  name           = var.external_group_identifier
  mount_accessor = vault_jwt_auth_backend.oidc.accessor
  canonical_id   = vault_identity_group.oidc_admin_group.id
}
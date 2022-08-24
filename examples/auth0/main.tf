resource "vault_policy" "admins" {
  name   = "vault-admins-auth0"
  policy = <<EOT
#vault-admin.hcl
#Allows very broad access and should not be used in production

# permit access to all sys backend configurations to administer Vault itself
path "sys/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# manage Vault auth methods
path "auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# manage Vault identities
path "identity/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# permit access to administer the OIDC auth method
path "oidc/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
EOT
}

module "root_oidc" {
  source = "../../"

  # path                      = "auth0" # To enable auth method at custom mount path
  oidc_discovery_url        = var.oidc_discovery_url
  oidc_client_id            = var.oidc_client_id
  oidc_client_secret        = var.oidc_client_secret
  allowed_redirect_uris     = var.allowed_redirect_uris
  user_claim                = "sub"
  groups_claim              = "https://my-vault-cluster.com/roles"
  additional_policies       = [vault_policy.admins.name]
  external_group_identifier = "vault-admins"
  group_name                = "auth0-admins"
}


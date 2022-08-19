resource "vault_policy" "admins" {
  name   = "vault-admins"
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

  oidc_discovery_url        = var.oidc_discovery_url
  oidc_client_id            = var.oidc_client_id
  oidc_client_secret        = var.oidc_client_secret
  allowed_redirect_uris     = var.allowed_redirect_uris
  user_claim                = "name" #should be "sub" or "oid" following the recommendation from Azure. In my lab I use name to more easily identify users.
  additional_policies       = [vault_policy.admins.name]
  external_group_identifier = var.external_group_identifier # AAD uses the AD group object ID to identify the group
}


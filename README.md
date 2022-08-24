# terraform-vault-oidc-auth-method
Terraform module for the Vault provider for enabling the OIDC auth method.

Currently it creates the following items:
- Enables the OIDC auth method at a configurable path
- A default role for the OIDC auth method with either the "default" Vault policy or NO Vault policy
- An external identity group that can be assigned additional Vault policies for permissions
- An identity group alias attached to the external identity group for mapping external IdP groups

The aim of this module is to solve a common scenario where a Vault operator needs to setup the OIDC auth method. The "default" role required for authentication will allow any user with valid credentials, and access to the OIDC application on the Identity Provider (IdP) side to successfully authenticate to Vault. The default behavior is to grant the "default" Vault policy to any user that is able to successfully authenticate. The default policy gives limited access for UI functionality, and things like cubbyhole and the tools under the "tools" tab in the UI. This behavior can be disabled by setting `no_default_policy = true`.

Additionally, the module will create a Vault external group, and group alias for mapping an existing group on the IdP side to the external group in Vault. Additional Vault policies can be assigned to the Vault external group for granting additional access. Often times this is used to map a group containing all Vault operators on the IdP side, and assigning some sort of Vault admin policy.

Additional external groups can be created for other groups that will be consuming vault. You can do so by referencing the `mount_accessor` for the OIDC auth method via the outputs or the module itself.

```
mount_accessor = module.oidc-auth-method.vault_jwt_auth_backend.oidc.accessor
```

## Examples:
- [Azure Active Directory](https://github.com/bmcdonald05/terraform-vault-oidc-auth-method/tree/main/examples/azure-active-directory)
- [Auth0](https://github.com/bmcdonald05/terraform-vault-oidc-auth-method/tree/main/examples/auth0)


## Usage

### Enable OIDC auth method

```hcl
module "oidc-auth-method" {
  source  = "bmcdonald05/oidc-auth-method/vault"
  version = "1.0.2"

  oidc_discovery_url        = "https://login.microsoftonline.com/<YOUR_TENNET_UUID>/v2.0"
  oidc_client_id            = "b4e4905f..."
  oidc_client_secret        = "b%.FoG8ezH..."
  allowed_redirect_uris     = ["http://localhost:8250/oidc/callback", "https://my-vault-cluster.com:8200/ui/vault/auth/oidc/oidc/callback"]
  user_claim                = "sub"
  additional_policies       = ["admin-vault-policy"]
  external_group_identifier = "6ba09846f6f3-b7f0-...." #Unique to each IdP. Usually the group name or in AAD the group object ID.
}
```

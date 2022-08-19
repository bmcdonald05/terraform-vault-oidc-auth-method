# terraform-vault-oidc-auth-method
Terraform module for the Vault provider for enabling the OIDC auth method.

Currently it creates the following items:
- Enables the OIDC auth method at a configurable path
- A default role for the OIDC auth method with either the "default" Vault policy or NO Vault policy
- An external identity group that can be assigned additional Vault policies for permissions
- An identity group alias attached to the external identity group for mapping external IdP groups

## Examples:
- [Azure Active Directory](https://github.com/bmcdonald05/terraform-vault-oidc-auth-method/tree/master/examples/azure-active-directory)
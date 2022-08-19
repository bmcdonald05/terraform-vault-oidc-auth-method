variable "allowed_redirect_uris" {
  type        = list(string)
  description = "The list of allowed values for redirect_uri during OIDC logins. For UI access the URI will follow the 'https://hostname:port_number/ui/vault/auth/oidc/oidc/callback' format. For CLI access it will usually be 'http://localhost:8250/oidc/callback'."
  default     = [""]
}

variable "enable_debug_log" {
  type        = bool
  description = "Log received OIDC tokens and claims when debug-level logging is active to troubleshoot issues."
  default     = false
}

variable "groups_claim" {
  type        = string
  description = "The claim to use to uniquely identify the set of groups to which the user belongs."
  default     = "groups"
}

variable "no_default_policy" {
  type        = bool
  description = "If set, the default policy will NOT be set on generated tokens; otherwise it will be added to the policies set in token_policies."
  default     = false
}

variable "oidc_client_id" {
  type        = string
  description = "Client ID used for OIDC backend."
  default     = ""
}

variable "oidc_client_secret" {
  type        = string
  description = "Client Secret used for OIDC backend."
  default     = ""
}

variable "oidc_discovery_url" {
  type        = string
  description = "The OIDC Discovery URL, without any .well-known component (base path)."
  default     = ""
}

variable "oidc_scopes" {
  type        = list(any)
  description = "If set, a list of OIDC scopes to be used with an OIDC role. The standard scope 'openid' is automatically included and need not be specified."
  default     = [""]
}

variable "path" {
  type        = string
  description = "Path to mount the OIDC auth backend"
  default     = "oidc"
}

variable "token_max_ttl" {
  type        = number
  description = "The incremental lifetime for generated tokens in number of seconds. Defaults to 604800 seconds or 7 days."
  default     = 604800
}

variable "token_ttl" {
  type        = number
  description = "The incremental lifetime for generated tokens in number of seconds. Defaults to 86400 seconds or 24 hours."
  default     = 86400
}

variable "user_claim" {
  type        = string
  description = "The claim to use to uniquely identify the user; this will be used as the name for the Identity entity alias created due to a successful login. The value will depend on the identity provider, please see the Vault [documentation](https://www.vaultproject.io/docs/auth/jwt/oidc-providers)"
  default     = ""
}

### External Group/Group Alias Variables ###

variable "additional_policies" {
  type        = list(any)
  description = "List of strings. Additional policies to add to external groups as desired."
  default     = [""]
}

variable "external_group_identifier" {
  type        = string
  description = "Name of the group alias to create. This name needs to match the group identifier for from the IdP, which differs depending on which IdP is used."
  default     = ""
}

variable "group_name" {
  type        = string
  description = "Name of the external identity group to create; defaults to 'oidc-admins-group'."
  default     = "oidc-admins-group"
}

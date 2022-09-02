variable "allowed_redirect_uris" {
  type        = list(string)
  description = "The list of allowed values for redirect_uri during OIDC logins. For UI access the URI will follow the 'https://hostname:port_number/ui/vault/auth/oidc/oidc/callback' format. For CLI access it will usually be 'http://localhost:8250/oidc/callback'."
  default     = [""]
}

variable "bound_audiences" {
  type        = list(string)
  description = "List of aud claims to match against. Any match is sufficient."
  default     = [""]
}

variable "bound_claims" {
  type        = map(string)
  description = "If set, a map of claims to values to match against. A claim's value must be a string, which may contain one value or multiple comma-separated values, e.g. 'red' or 'red,green,blue'."
  default     = {}
}

variable "bound_claims_type" {
  type        = string
  description = "How to interpret values in the claims/values map (bound_claims): can be either string (exact match) or glob (wildcard match)."
  default     = "string"
}

variable "bound_issuer" {
  type        = string
  description = "The value against which to match the iss claim in a JWT."
  default     = null
}

variable "bound_subject" {
  type        = string
  description = "If set, requires that the sub claim matches this value."
  default     = null
}

variable "claim_mappings" {
  type        = map(string)
  description = "If set, a map of claims (keys) to be copied to specified metadata fields (values)."
  default     = {}
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

# variable "listing_visibility" {
#   type        = string
#   description = "Specifies whether to show this mount in the UI-specific listing endpoint. Valid values are 'unauth' or 'hidden'."
#   default     = null
# }

variable "namespace" {
  type        = string
  description = "The namespace to provision the resource in for newer 'simple' namespace definitions. The value should not contain leading or trailing forward slashes."
  default     = null
}

variable "namespace_in_state" {
  type        = bool
  description = "Pass namespace in the OIDC state parameter instead of as a separate query parameter. With this setting, the allowed redirect URL(s) in Vault and on the provider side should not contain a namespace query parameter."
  default     = true
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

variable "oidc_discovery_ca_pem" {
  type        = string
  description = "The CA certificate or chain of certificates, in PEM format, to use to validate connections to the OIDC Discovery URL. If not set, system certificates are used"
  default     = null
}

variable "oidc_discovery_url" {
  type        = string
  description = "The OIDC Discovery URL, without any .well-known component (base path)."
  default     = ""
}

variable "oidc_response_mode" {
  type        = string
  description = "The response mode to be used in the OAuth2 request. Allowed values are query and form_post. Defaults to query."
  default     = null
}

variable "oidc_response_types" {
  type        = list(any)
  description = "List of response types to request. Allowed values are 'code' and 'id_token'. Defaults to ['code']."
  default     = [""]
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

variable "provider_config" {
  type        = map(string)
  description = "Provider specific handling configuration. All values may be strings, and the provider will convert to the appropriate type when configuring Vault."
  default     = {}
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
  description = "The actual name of the external identity group to create; defaults to 'oidc-admins-group'."
  default     = "oidc-admins-group"
}

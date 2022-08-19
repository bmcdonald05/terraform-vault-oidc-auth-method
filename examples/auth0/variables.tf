variable "vault_cluster_addr" {
  default = ""
}

variable "oidc_discovery_url" {
  type        = string
  description = "The OIDC Discovery URL, Formatted like: 'https://<YOUR_AUTH0_DOMAIN>/'"
  default     = ""
}

variable "oidc_client_secret" {
  type        = string
  description = "Client Secret used for OIDC backends."
  default     = ""
}

variable "oidc_client_id" {
  type        = string
  description = "Client ID used for OIDC backends."
  default     = ""
}

variable "allowed_redirect_uris" {
  type        = list(any)
  description = "List of strings of allowed redirect URIs. Should be the two redirect URIs for Vault CLI and UI access."
}
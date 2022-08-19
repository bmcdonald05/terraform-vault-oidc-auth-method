terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.2"
    }
  }
}

## Use of this Vault provider block assumes you export your Vault token prior to running Terraform with "export VAULT_TOKEN=<your_vault_token>"
provider "vault" {
  address         = var.vault_cluster_addr
  skip_tls_verify = true         #If TLS has not been setup
  namespace       = "tf-modules" #If using a namespace
}
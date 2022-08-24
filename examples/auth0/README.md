# Example for enabling Auth0 for OIDC authentication

You will find a `terraform.auto.tfvars.sample` file in this directory. Rename the file to `terraform.auto.tfvars` and define the required variables.

It will also print the output information for the created items for reference if you are interested.

For a guide on how to setup your Auth0 application please see the HashiCorp learn tutorial [here](https://learn.hashicorp.com/tutorials/vault/oidc-auth?in=vault/auth-methods#create-an-auth0-group)


## Usage
Run the terraform code:
```
terraform init
terraform plan
terraform apply
```
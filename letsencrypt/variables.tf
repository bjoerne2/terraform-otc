### OpenStack Credentials
variable "username" {}

variable "password" {}

variable "domain_name" {}

variable "tenant_name" {
  default = "eu-de"
}

variable "region" {
  default = "eu-de"
}

variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "identity_endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com/v3/auth/tokens"
}

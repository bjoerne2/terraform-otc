resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = "${tls_private_key.private_key.private_key_pem}"
  email_address   = "info@bjoerne.com"
}

resource "acme_certificate" "certificate" {
  account_key_pem           = "${acme_registration.reg.account_key_pem}"
  common_name               = "*.gradar.rocks"
  dns_challenge {
    provider = "otc"

    config {
      OTC_USER_NAME         = "${var.username}"
      OTC_DOMAIN_NAME       = "${var.domain_name}"
      OTC_PASSWORD          = "${var.password}"
      OTC_PROJECT_NAME      = "${var.region}"
      OTC_IDENTITY_ENDPOINT = "${var.identity_endpoint}"
    }
  }
}

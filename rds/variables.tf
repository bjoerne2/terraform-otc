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

### OTC Specific Settings
variable "external_network" {
  default = "admin_external_net"
}

### Project Settings
variable "project" {
  default = "terraform"
}

variable "subnet_cidr" {
  default = "192.168.10.0/24"
}

variable "ssh_pub_key" {
  default = "~/.ssh/id_rsa.pub"
}

### VM (Instance) Settings
variable "instance_count" {
  default = "1"
}

######## RDS #########
#######################################

### Datastore
variable "rds_datastore_version" {
  default = "5.7.17"
}

### RDS Port
variable "rds_db_port" {
  default = "8635"
}

### RDS password
variable "rds_db_root_user_pw" {
  default = "Sicheres!Passwort123"
}

### RDS Backup retention time
variable "rds_backup_keepdays" {
  default = "1"
}

### RDS size
variable "rds_db_size" {
  default = "100"
}

resource "openstack_compute_secgroup_v2" "secgrp_rds" {
  name        = "${var.project}-secgrp-rds"
  description = "RDS Security Group"

  rule {
    from_port   = "${var.rds_db_port}"
    to_port     = "${var.rds_db_port}"
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

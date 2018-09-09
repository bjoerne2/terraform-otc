data "opentelekomcloud_rds_flavors_v1" "flavor" {
    region = "eu-de"
    datastore_name = "MySQL"
    datastore_version = "5.7.17"
    speccode = "rds.mysql.s1.medium"
}

resource "opentelekomcloud_compute_secgroup_v2" "secgrp_rds" {
  name        = "secgrp-rds-instance"
  description = "Rds Security Group"
}

resource "opentelekomcloud_rds_instance_v1" "instance" {
  name = "rds-instance"
  datastore {
    type = "MySQL"
    version = "5.7.17"
  }
  flavorref = "${data.opentelekomcloud_rds_flavors_v1.flavor.id}"
  volume {
    type = "COMMON"
    size = 200
  }
  region = "eu-de"
  availabilityzone = "eu-de-02"
  vpc = "${openstack_networking_router_v2.router.id}"
  nics {
    subnetid = "${openstack_networking_subnet_v2.subnet.id}"
  }
  securitygroup {
    id = "${opentelekomcloud_compute_secgroup_v2.secgrp_rds.id}"
  }
  dbport = "8635"
  backupstrategy = {
    starttime = "04:00:00"
    keepdays = 4
  }
  dbrtpd = "Huangwei!120521"
  ha = {
    enable = true
    replicationmode = "async"
  }
  depends_on = ["opentelekomcloud_compute_secgroup_v2.secgrp_rds"]
}

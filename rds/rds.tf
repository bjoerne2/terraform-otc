data "opentelekomcloud_rds_flavors_v1" "rds_flavor" {
    region            = "${var.region}"
    datastore_name    = "MySQL"
    datastore_version = "${var.rds_datastore_version}"
    speccode          = "rds.mysql.s1.medium.ha"
}

resource "opentelekomcloud_rds_instance_v1" "instance" {
  name              = "${var.project}-rds-instance"
  region            = "${var.region}"
  vpc               = "${openstack_networking_router_v2.router.id}"
  availabilityzone  = "eu-de-02"

  dbport            = "${var.rds_db_port}"
  dbrtpd            = "${var.rds_db_root_user_pw}"

  backupstrategy = {
    starttime       = "04:00:00"
    keepdays        = "${var.rds_backup_keepdays}"
  }

  ha = {
    enable          = true
    replicationmode = "async"
  }

  datastore {
    type            = "MySQL"
    version         = "${var.rds_datastore_version}"
  }
  flavorref         = "${data.opentelekomcloud_rds_flavors_v1.rds_flavor.id}"

  volume {
    type            = "COMMON"
    size            = "${var.rds_db_size}"
  }

  nics {
    subnetid        = "${openstack_networking_network_v2.network.id}"
  }

  securitygroup {
    id              = "${openstack_compute_secgroup_v2.secgrp_rds.id}"
  }

  depends_on        = ["openstack_networking_router_interface_v2.interface"]
}

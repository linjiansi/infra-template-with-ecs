locals {
  project              = "sample-template"
  elb_sg_ingress_ports = [80, 443, 8080]
  database_port        = 5432
}

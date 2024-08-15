resource "yandex_vpc_network" "vpcnet" {
  name = var.vpc_net_name
}

resource "yandex_vpc_subnet" "vpcnet-subnet" {
  name           = var.vpc_subnet_name
  zone           = var.yc_zone
  network_id     = yandex_vpc_network.vpcnet.id
  v4_cidr_blocks = var.vpc_subnet_cidr
}

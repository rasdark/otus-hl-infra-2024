locals {
  ssh_public_key = "${var.ssh_private_key}.pub"
}

data "yandex_compute_image" "image-01" {
  family = var.image_family
}

resource "yandex_compute_instance" "vm" {
  name        = "vm-01"
  platform_id = "standard-v1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.image-01.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.vpcnet-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ansible_user}:${file(local.ssh_public_key)}"
  }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tpl", {
    vm_ip   = yandex_compute_instance.vm.network_interface.0.nat_ip_address
    vm_name = yandex_compute_instance.vm.fqdn
    vm_user = var.ansible_user
  })
  filename = var.ansible_inventory_file
}

resource "null_resource" "ansible_provision" {
  depends_on = [resource.yandex_compute_instance.vm]
  provisioner "local-exec" {
    command     = "ansible-playbook -i ${var.ansible_inventory_file} --private-key ${var.ssh_private_key} ansible/install.yml"
    interpreter = ["bash", "-c"]
    working_dir = path.module
  }
}

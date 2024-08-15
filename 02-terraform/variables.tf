# variable "yc_token" {
#     type = string
# }

# variable "yc_cloud_id" {
#     type = string
# }

# variable "yc_folder_id" {
#     type = string
# }

variable "yc_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vpc_net_name" {
  type    = string
  default = "vpc-network"
}

variable "vpc_subnet_name" {
  type    = string
  default = "vpc-subnet"
}

variable "vpc_subnet_cidr" {
  type    = list(string)
  default = ["192.168.10.0/24"]
}

variable "image_family" {
  type    = string
  default = "ubuntu-2204-lts"
}

variable "ssh_private_key" {
  type    = string
  default = "~/.ssh/id_rsa"
}

variable "ansible_user" {
  type    = string
  default = "ubuntu"
}

variable "ansible_inventory_file" {
  type    = string
  default = "hosts.ini"
}
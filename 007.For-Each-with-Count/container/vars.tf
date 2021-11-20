resource "random_string" "random_string" {
    length = 4
    special = false
    upper = true
    lower = false
    min_upper = 1
    min_numeric = 3
}
variable  "image_name" {}
variable "image_version" {
    default = "latest"
}
variable "registry_name" {
    default = "docker.io"
}
variable "ports" {
    type = map(list(number))
    default = {
        internal_ports = [80]
        external_ports = [8080]
    }
}
variable "volumes" {
    type = map(string)
    default = {
        host_path = "~/docker-volumes"
        container_path = "/usr/share/nginx/"
    }
}

variable "count_in" {
    default = 1
    type = number
}
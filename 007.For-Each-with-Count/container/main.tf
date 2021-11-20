locals {
    resources = {
        docker_container = {
            image_name = "${var.registry_name}/${var.image_name}:${var.image_version}"
            container_name = "container-${var.image_name}-${random_string.random_string.result}"
            internal_ports = var.ports.internal_ports
            external_ports = var.ports.external_ports
            volumes = {
                host_path = "${pathexpand(var.volumes.host_path)}/volume-container-${var.image_name}"
                container_path  = var.volumes.container_path
            }
        }
    }
}

resource "docker_container" "docker_container" {
    image = local.resources.docker_container.image_name
    name = "${local.resources.docker_container.container_name}-${count.index}"
    count = var.count_in
    ports {
        internal = local.resources.docker_container.internal_ports[0]
        external = local.resources.docker_container.external_ports[count.index]
    }
    volumes {
        host_path = "${local.resources.docker_container.volumes.host_path}-${count.index}"
        container_path = local.resources.docker_container.volumes.container_path

    }
}
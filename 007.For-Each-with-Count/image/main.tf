resource "docker_image" "docker_image" {
    name = "${var.registry_name}/${var.image_name}:${var.image_version}"
}
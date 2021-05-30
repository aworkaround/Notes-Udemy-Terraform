terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}
provider "docker" {}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}
resource "random_string" "random" {
  count = 3
  length = 4
  special = false
  upper = false
}
resource "docker_container" "nodered_container" {
  count = 3
  name = "nodered-${random_string.random[count.index].result}"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880 + count.index
  }
}

# output using splat(*)
output "container-name" {
  value = docker_container.nodered_container[*].name
  description = "The Name of the containers created."
}
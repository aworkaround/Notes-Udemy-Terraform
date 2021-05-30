terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}
provider "docker" {}

resource "docker_image" "nodered_image" {
  # name = "nodered/node-red:latest" # Please use this
  name = "localhost:5000/node-red:latest" # Don't use this
}
resource "random_string" "random" {
  count = 1
  length = 4
  special = false
  upper = false
}
resource "docker_container" "nodered_container" {
  count = 1
  name = "nodered-${random_string.random[count.index].result}"
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    # external = 1880 + count.index
  }
}

# Imported resource
resource "docker_container" "nodered_container2" {
  count = 1
  name = "nodered-j88p" # actual name of container
  image = docker_image.nodered_image.latest
}

# output using splat(*)
output "container-name" {
  value = docker_container.nodered_container[*].name
  description = "The Name of the containers created."
}
# output using For loop
output "ip-address" {
  value = [for i in docker_container.nodered_container[*]: join(":", [i.ip_address],i.ports[*]["external"])]
  description = "The IP address of containers created."
}
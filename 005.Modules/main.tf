module "images" {
  source = "./images"
}
resource "docker_container" "nodered_container" {
  name = "nodered-01"
  image = module.images.nodered
  ports {
    external = 1880
    internal = 1880
  }
}
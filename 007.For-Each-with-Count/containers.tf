locals {
  containers = {
    nginx = {
      image_version = "1.21.4-alpine"
      external_ports = [8080,8090]
    }
    httpd = {
      image_version = "2.4.51-alpine"
      external_ports = [8081,8091]
    }
  }
}

module "container" {
  source = "./container"
  for_each = local.containers
  count_in = length(each.value.external_ports)
  image_name = each.key
  image_version = each.value.image_version
  ports = {
    external_ports = each.value.external_ports
    internal_ports = [80]
  }
}
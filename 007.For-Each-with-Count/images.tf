locals {
  images = {
    nginx = {
      image_version = "1.21.4-alpine"
    }
    httpd = {
      image_version = "2.4.51-alpine"
    }
  }
}

module "image" {
  source = "./image"
  for_each = local.images
  image_name = each.key
  image_version = each.value.image_version
}
locals {
    deployments = {
        nginx = {
            image_name = "nginx"
            image_version = "1.21.4-alpine"
        }
        python = {
            image_name = "python"
            image_version = "3.9.9-alpine3.14"
        }
        busybox = {
            image_name = "busybox"
            image_version = "latest"
        }
    }
    registry_name = "docker.io"
}

module "image" {
    source = "./image"
    for_each = local.deployments
    image_name = each.key
    image_version = each.value["image_version"]
    registry_name = local.registry_name
}
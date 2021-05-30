output "nodered" {
  # This will return ID of image Nodered
  value = docker_image.nodered_image.latest
}
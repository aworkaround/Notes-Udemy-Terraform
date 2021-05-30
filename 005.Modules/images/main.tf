resource "docker_image" "nodered_image" {
  # name = "nodered/node-red:latest" # Please use this
  name = "localhost:5000/node-red:latest" # Don't use this
}
output "url" {
  value = "http://127.0.0.1:${docker_container.nodered_container.ports[0].external}"
}
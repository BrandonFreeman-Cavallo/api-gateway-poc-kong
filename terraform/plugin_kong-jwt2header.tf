resource "kong_plugin" "jwt2header" {
  name        = "kong-jwt2header"
  config_json = file("${path.module}/configs/jwt2header.json")
}

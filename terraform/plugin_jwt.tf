resource "kong_plugin" "jwt" {
  name        = "jwt"
  config_json = file("${path.module}/configs/jwt.json")
}

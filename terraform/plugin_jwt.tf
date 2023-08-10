resource "kong_plugin" "jwt_jwt" {
  name        = "jwt"
  config_json = file("${path.module}/configs/jwt.json")
  service_id  = kong_service.http_test.id
  route_id    = kong_route.jwt.id
}

resource "kong_plugin" "jwt_org_cavallo" {
  name        = "jwt"
  config_json = file("${path.module}/configs/jwt.json")
  service_id  = kong_service.http_test.id
  route_id    = kong_route.org_cavallo.id
}

# resource "kong_plugin" "jwt_org_unknown" {
#   name        = "jwt"
#   config_json = file("${path.module}/configs/jwt.json")
#   service_id  = kong_service.http_test.id
#   route_id    = kong_route.org_unknown.id
# }

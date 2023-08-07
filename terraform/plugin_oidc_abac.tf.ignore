resource "kong_plugin" "oidc_abac" {
  name        = "oidc"
  config_json = file("${path.module}/configs/oidc/abac.json")
  service_id  = kong_service.http_test.id
  route_id    = kong_route.abac.id
}

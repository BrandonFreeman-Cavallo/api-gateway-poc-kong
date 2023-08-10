resource "kong_plugin" "custom_plugin" {
  name        = "custom_plugin"
  config_json = file("${path.module}/configs/custom_plugin.json")
  service_id  = kong_service.http_test.id
  route_id    = kong_route.org_cavallo.id
}

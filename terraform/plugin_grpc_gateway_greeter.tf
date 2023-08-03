resource "kong_plugin" "grpc_gateway_greeter" {
  tags = ["grpc-gateway-greeter"]
  name = "grpc-gateway"
  #   protocols = [
  #     "grpc",
  #     "grpcs",
  #     "http",
  #     "https"
  #   ]
  config_json = file("${path.module}/configs/grpc_gateway/greeter.json")
  service_id  = kong_service.grpc_test.id
  route_id    = kong_route.grpc_rest_greeter.id
}

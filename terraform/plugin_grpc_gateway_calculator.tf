resource "kong_plugin" "grpc_gateway_calculator" {
  tags = ["grpc-gateway-calculator"]
  name = "grpc-gateway"
  #   protocols = [
  #     "grpc",
  #     "grpcs",
  #     "http",
  #     "https"
  #   ]
  config_json = file("${path.module}/configs/grpc_gateway/calculator.json")
  service_id  = kong_service.grpc_test.id
  route_id    = kong_route.grpc_rest_calculator.id
}

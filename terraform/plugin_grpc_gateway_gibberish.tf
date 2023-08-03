resource "kong_plugin" "grpc_gateway_gibberish" {
  tags = ["grpc-gateway-gibberish"]
  name = "grpc-gateway"
  #   protocols = [
  #     "grpc",
  #     "grpcs",
  #     "http",
  #     "https"
  #   ]
  config_json = file("${path.module}/configs/grpc_gateway/gibberish.json")
  service_id  = kong_service.grpc_test.id
  route_id    = kong_route.grpc_rest_gibberish.id
}

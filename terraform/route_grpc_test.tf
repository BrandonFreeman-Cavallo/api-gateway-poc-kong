resource "kong_route" "grpc_test" {
  paths = [
    "/"
  ]
  regex_priority             = 0
  request_buffering          = true
  response_buffering         = true
  preserve_host              = false
  https_redirect_status_code = 426
  strip_path                 = false
  name                       = "grpc-test"
  protocols = [
    "grpc"
  ]
  path_handling = "v0"
  service_id    = kong_service.grpc_test.id
}

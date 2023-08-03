resource "kong_route" "grpc_rest_gibberish" {
  paths = [
    "/v1/gibberish"
  ]
  regex_priority             = 0
  request_buffering          = true
  response_buffering         = true
  preserve_host              = false
  https_redirect_status_code = 426
  strip_path                 = true
  name                       = "grpc-rest-gibberish"
  methods = [
    "GET",
    "POST"
  ]
  protocols = [
    "http"
  ]
  path_handling = "v0"
  service_id    = kong_service.grpc_test.id
}

resource "kong_route" "http_test" {
  paths = [
    "/test/rest"
  ]
  regex_priority             = 0
  request_buffering          = true
  response_buffering         = true
  preserve_host              = false
  https_redirect_status_code = 426
  strip_path                 = true
  name                       = "http-test"
  methods = [
    "GET"
  ]
  protocols = [
    "http"
  ]
  path_handling = "v0"
  service_id    = kong_service.http_test.id
}

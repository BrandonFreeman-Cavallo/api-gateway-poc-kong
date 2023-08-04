resource "kong_route" "abac" {
  paths = [
    "/abac"
  ]
  regex_priority             = 0
  request_buffering          = true
  response_buffering         = true
  preserve_host              = false
  https_redirect_status_code = 426
  strip_path                 = true
  name                       = "abac"
  methods = [
    "GET",
    "POST"
  ]
  protocols = [
    "http"
  ]
  path_handling = "v0"
  service_id    = kong_service.http_test.id
}

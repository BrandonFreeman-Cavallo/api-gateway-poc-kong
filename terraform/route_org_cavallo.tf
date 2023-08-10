resource "kong_route" "org_cavallo" {
  paths = [
    "/org"
  ]
  #   header {
  #     name   = "something"
  #     values = ["meow"]
  #   }
  #   header {
  #     name   = "X-Kong-JWT-Claim-Cavallo-org_name"
  #     values = ["cavallo"]
  #   }
  regex_priority             = 0
  request_buffering          = true
  response_buffering         = true
  preserve_host              = false
  https_redirect_status_code = 426
  strip_path                 = true
  name                       = "org_cavallo"
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

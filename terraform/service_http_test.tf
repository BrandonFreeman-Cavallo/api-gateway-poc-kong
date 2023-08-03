resource "kong_service" "http_test" {
  port            = 80
  read_timeout    = 60000
  path            = "/"
  write_timeout   = 60000
  tls_verify      = false
  host            = "http-test"
  name            = "http-test"
  protocol        = "http"
  connect_timeout = 60000
  retries         = 5
}

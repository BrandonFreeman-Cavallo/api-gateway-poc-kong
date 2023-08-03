resource "kong_service" "grpc_test" {
  connect_timeout = 60000
  host            = "grpc-test"
  name            = "grpc-test"
  port            = 80
  protocol        = "grpc"
  read_timeout    = 60000
  retries         = 5
  write_timeout   = 60000
}

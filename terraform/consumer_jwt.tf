resource "kong_consumer" "auth0_jwt" {
  username = "Auth0_JWT"
}

resource "kong_consumer_jwt_auth" "consumer_jwt_config" {
  consumer_id    = kong_consumer.auth0_jwt.id
  algorithm      = "RS256"
  key            = "https://dev-e0v104xjhwtid6mb.us.auth0.com/"
  rsa_public_key = file("${path.module}/configs/pubkey.pem")
  secret         = " "
}

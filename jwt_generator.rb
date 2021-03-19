#!/usr/bin/env ruby

require 'openssl'
require 'jwt'  # https://rubygems.org/gems/jwt

pem = Dir.glob("./*.private-key.pem").first()

# Private key contents
private_pem = File.read(pem)
private_key = OpenSSL::PKey::RSA.new(private_pem)
puts private_key
# # Generate the JWT
# payload = {
#   # issued at time, 60 seconds in the past to allow for clock drift
#   iat: Time.now.to_i - 60,
#   # JWT expiration time (10 minute maximum)
#   exp: Time.now.to_i + (10 * 60),
#   # GitHub App's identifier
#   iss: 105926
# }

# jwt = JWT.encode(payload, private_key, "RS256")

# # internetAccessTokenRes = exec("./installation_access_token_generator.sh", jwt)

# puts jwt
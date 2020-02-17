# frozen_string_literal: true

ENV_VARS = {
  verifier_email: 'admin@bestweb.com.ua',
  access_tokens: 'token',
  whitelisted_domains: 'true.com',
  blacklisted_domains: 'false.com'
}.freeze

def set_env_vars
  ENV_VARS.each { |var, value| ENV[var.to_s.upcase] = value }
end

set_env_vars

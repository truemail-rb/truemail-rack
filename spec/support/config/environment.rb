# frozen_string_literal: true

ENV_VARS = {
  verifier_email: 'admin@bestweb.com.ua',
  access_tokens: 'token',
  whitelisted_emails: 'whitelisted@example.com',
  blacklisted_emails: 'blacklisted@example.com',
  whitelisted_domains: 'true.com',
  blacklisted_domains: 'false.com',
  log_stdout: 'false'
}.freeze

def set_env_vars(**vars)
  ENV_VARS.merge(vars).each { |var, value| ENV[var.to_s.upcase] = value }
end

set_env_vars

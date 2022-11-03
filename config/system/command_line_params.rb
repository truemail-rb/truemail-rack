# frozen_string_literal: true

require 'dry-struct'

module System
  class CommandLineParams < Dry::Struct
    attribute :verifier_email, System::Types::String
    attribute :verifier_domain, System::Types::String.optional
    attribute :email_pattern, System::Types::StringToRegex.optional
    attribute :smtp_error_body_pattern, System::Types::StringToRegex.optional
    attribute :connection_timeout, System::Types::Coercible::Integer.optional
    attribute :response_timeout, System::Types::Coercible::Integer.optional
    attribute :connection_attempts, System::Types::Coercible::Integer.optional
    attribute :default_validation_type, System::Types::Coercible::Symbol.optional
    attribute :validation_type_for, System::Types::StringToHash.optional
    attribute :whitelisted_emails, System::Types::StringToArray.optional
    attribute :blacklisted_emails, System::Types::StringToArray.optional
    attribute :whitelisted_domains, System::Types::StringToArray.optional
    attribute :blacklisted_domains, System::Types::StringToArray.optional
    attribute :whitelist_validation, System::Types::Params::Bool.optional
    attribute :blacklisted_mx_ip_addresses, System::Types::StringToArray.optional
    attribute :dns, System::Types::StringToArray.optional
    attribute :not_rfc_mx_lookup_flow, System::Types::Params::Bool.optional
    attribute :smtp_port, System::Types::Coercible::Integer.optional
    attribute :smtp_fail_fast, System::Types::Params::Bool.optional
    attribute :smtp_safe_check, System::Types::Params::Bool.optional
    attribute :access_tokens, System::Types::StringToArray
    attribute :log_stdout, System::Types::Params::Bool.optional
  end
end

# frozen_string_literal: true

module System
  class Configuration
    class Error < StandardError; end

    INVALID_COMMAND_LINE_PARAMS = 'invalid command line params'
    COMMAND_LINE_ATTRS = %i[
      email_pattern
      smtp_error_body_pattern
      verifier_email
      verifier_domain
      connection_timeout
      response_timeout
      connection_attempts
      default_validation_type
      validation_type_for
      whitelisted_emails
      blacklisted_emails
      whitelisted_domains
      blacklisted_domains
      whitelist_validation
      blacklisted_mx_ip_addresses
      dns
      not_rfc_mx_lookup_flow
      smtp_port
      smtp_fail_fast
      smtp_safe_check
      access_tokens
      log_stdout
    ].freeze

    class << self
      def command_line_params
        @command_line_params ||=
          System::CommandLineParams.new(
            System::Configuration::COMMAND_LINE_ATTRS.to_h { |key| [key, ENV[key.to_s.upcase]] }
          ).to_h.compact
      rescue Dry::Struct::Error
        raise System::Configuration::Error, System::Configuration::INVALID_COMMAND_LINE_PARAMS
      end

      private

      def reset_command_line_params!
        @command_line_params = nil
      end
    end
  end
end

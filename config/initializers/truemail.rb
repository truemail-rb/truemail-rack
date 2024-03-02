# frozen_string_literal: true

require 'truemail'

Truemail.configure do |config|
  truemail_core_params = System::Configuration::COMMAND_LINE_ATTRS[0...-2]
  System::Configuration.command_line_params
    .slice(*truemail_core_params)
    .each { |key, value| config.public_send(:"#{key}=", value) }
end

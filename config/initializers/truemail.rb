# frozen_string_literal: true

require 'truemail'

Truemail.configure do |config|
  System::Configuration.command_line_params
    .reject { |key, _| key.eql?(:access_tokens) }
    .each { |key, value| config.public_send("#{key}=", value) }
end
